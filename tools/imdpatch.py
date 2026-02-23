#!/usr/bin/env python3
"""
IMD Boot Sector Patcher
Patches the first 2KB of an IMD disk image with a boot loader.
Specifically designed for QX-10 disks with 16x256 byte sectors on track 0.
"""

import sys
import struct

def read_imd_header(f):
    """Read IMD text header until 0x1A terminator"""
    header = bytearray()
    while True:
        byte = f.read(1)
        if not byte:
            raise ValueError("Unexpected EOF in IMD header")
        header.extend(byte)
        if byte[0] == 0x1A:
            break
    return bytes(header)

def read_track_header(f):
    """Read a track header and return track info"""
    mode = struct.unpack('B', f.read(1))[0]
    cylinder = struct.unpack('B', f.read(1))[0]
    head_flags = struct.unpack('B', f.read(1))[0]
    num_sectors = struct.unpack('B', f.read(1))[0]
    sector_size_code = struct.unpack('B', f.read(1))[0]

    head = head_flags & 0x3F
    has_cylinder_map = (head_flags & 0x80) != 0
    has_head_map = (head_flags & 0x40) != 0

    # Sector size: 0=128, 1=256, 2=512, 3=1024, 4=2048, 5=4096, 6=8192
    sector_size = 128 << sector_size_code

    # Read sector numbering map
    sector_map = f.read(num_sectors)

    # Read optional cylinder map
    cylinder_map = None
    if has_cylinder_map:
        cylinder_map = f.read(num_sectors)

    # Read optional head map
    head_map = None
    if has_head_map:
        head_map = f.read(num_sectors)

    return {
        'mode': mode,
        'cylinder': cylinder,
        'head': head,
        'head_flags': head_flags,
        'num_sectors': num_sectors,
        'sector_size_code': sector_size_code,
        'sector_size': sector_size,
        'sector_map': sector_map,
        'cylinder_map': cylinder_map,
        'head_map': head_map
    }

def read_sector_data(f, sector_size):
    """Read one sector's data"""
    sector_type = struct.unpack('B', f.read(1))[0]

    if sector_type == 0:
        # Unavailable sector
        return (sector_type, None)
    elif sector_type in [0x01, 0x03, 0x05, 0x07]:
        # Normal data (possibly with flags)
        data = f.read(sector_size)
        return (sector_type, data)
    elif sector_type in [0x02, 0x04, 0x06, 0x08]:
        # Compressed (all same byte)
        fill_byte = f.read(1)
        data = fill_byte * sector_size
        return (sector_type, data)
    else:
        raise ValueError(f"Unknown sector type: 0x{sector_type:02X}")

def write_sector_data(f, sector_type, data):
    """Write one sector's data"""
    f.write(struct.pack('B', sector_type))

    if sector_type == 0:
        # Unavailable sector - no data
        pass
    elif sector_type in [0x01, 0x03, 0x05, 0x07]:
        # Normal data
        f.write(data)
    elif sector_type in [0x02, 0x04, 0x06, 0x08]:
        # Compressed - write just the fill byte
        f.write(data[0:1])
    else:
        raise ValueError(f"Unknown sector type: 0x{sector_type:02X}")

def patch_imd(imd_path, boot_path, output_path):
    """Patch boot loader into first 2KB of IMD file"""

    # Read boot loader
    with open(boot_path, 'rb') as f:
        boot_data = f.read()

    if len(boot_data) > 2048:
        raise ValueError(f"Boot loader too large: {len(boot_data)} bytes (max 2048)")

    # Pad to 2KB
    boot_data = boot_data + b'\x00' * (2048 - len(boot_data))

    print(f"Patching {imd_path} with {boot_path} ({len(boot_data)} bytes)...")

    # Read entire IMD file
    with open(imd_path, 'rb') as f:
        # Read header
        header = read_imd_header(f)

        # Read first track (should be track 0, head 0 with 16x256 sectors)
        track0 = read_track_header(f)

        if track0['cylinder'] != 0 or track0['head'] != 0:
            raise ValueError(f"Expected track 0 head 0, got cyl={track0['cylinder']} head={track0['head']}")

        if track0['sector_size'] != 256:
            raise ValueError(f"Expected 256-byte sectors, got {track0['sector_size']}")

        if track0['num_sectors'] < 8:
            raise ValueError(f"Expected at least 8 sectors, got {track0['num_sectors']}")

        print(f"Track 0: {track0['num_sectors']} sectors of {track0['sector_size']} bytes")

        # Read all sectors from track 0
        sectors = []
        for i in range(track0['num_sectors']):
            sector_type, data = read_sector_data(f, track0['sector_size'])
            sectors.append((sector_type, data))

        # Build mapping from logical sector number to physical sector index
        sector_map = track0['sector_map']
        logical_to_physical = {}
        for phys_idx, logical_num in enumerate(sector_map):
            logical_to_physical[logical_num] = phys_idx

        print(f"Sector map: {[f'{s}' for s in sector_map]}")

        # Patch logical sectors 1-8 (2048 bytes = 8 * 256)
        # Assuming boot loader starts at logical sector 1
        for logical_sector in range(1, 9):
            if logical_sector not in logical_to_physical:
                raise ValueError(f"Logical sector {logical_sector} not found in sector map")

            phys_idx = logical_to_physical[logical_sector]
            offset = (logical_sector - 1) * 256
            patch_chunk = boot_data[offset:offset+256]
            # Use type 0x01 (normal data) for patched sectors
            sectors[phys_idx] = (0x01, patch_chunk)
            print(f"  Patching logical sector {logical_sector} (physical index {phys_idx})")

        # Save position after track 0
        rest_of_file = f.read()

    # Write output
    with open(output_path, 'wb') as f:
        # Write header
        f.write(header)

        # Write track 0 header
        f.write(struct.pack('B', track0['mode']))
        f.write(struct.pack('B', track0['cylinder']))
        f.write(struct.pack('B', track0['head_flags']))
        f.write(struct.pack('B', track0['num_sectors']))
        f.write(struct.pack('B', track0['sector_size_code']))
        f.write(track0['sector_map'])
        if track0['cylinder_map']:
            f.write(track0['cylinder_map'])
        if track0['head_map']:
            f.write(track0['head_map'])

        # Write patched sectors
        for sector_type, data in sectors:
            write_sector_data(f, sector_type, data)

        # Write rest of file unchanged
        f.write(rest_of_file)

    print(f"Patched disk image written to {output_path}")

if __name__ == '__main__':
    if len(sys.argv) != 4:
        print("Usage: imdpatch.py <input.imd> <boot.bin> <output.imd>")
        print("Patches boot loader (max 2KB) into first track of IMD disk image")
        sys.exit(1)

    imd_path = sys.argv[1]
    boot_path = sys.argv[2]
    output_path = sys.argv[3]

    try:
        patch_imd(imd_path, boot_path, output_path)
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)
