; YM2149 clock: 1996800 Hz; tone period = round(clock / (16 * f))

; MIDI note (0-127) in quarter-semitone steps -> 12-bit tone period.
; index q = 4 * note + bend (bend in quarter semitones, -48..47),
; clamped to 0..511.  Periods clamp to 1..4095.
ym_period_qtable:
   dw 4095, 4095, 4095, 4095   ; note   0
   dw 4095, 4095, 4095, 4095   ; note   1
   dw 4095, 4095, 4095, 4095   ; note   2
   dw 4095, 4095, 4095, 4095   ; note   3
   dw 4095, 4095, 4095, 4095   ; note   4
   dw 4095, 4095, 4095, 4095   ; note   5
   dw 4095, 4095, 4095, 4095   ; note   6
   dw 4095, 4095, 4095, 4095   ; note   7
   dw 4095, 4095, 4095, 4095   ; note   8
   dw 4095, 4095, 4095, 4095   ; note   9
   dw 4095, 4095, 4095, 4095   ; note  10
   dw 4095, 4095, 4095, 4095   ; note  11
   dw 4095, 4095, 4095, 4095   ; note  12
   dw 4095, 4095, 4095, 4095   ; note  13
   dw 4095, 4095, 4095, 4095   ; note  14
   dw 4095, 4095, 4095, 4095   ; note  15
   dw 4095, 4095, 4095, 4095   ; note  16
   dw 4095, 4095, 4095, 4095   ; note  17
   dw 4095, 4095, 4095, 4095   ; note  18
   dw 4095, 4095, 4095, 4095   ; note  19
   dw 4095, 4095, 4095, 4095   ; note  20
   dw 4095, 4095, 4095, 4095   ; note  21
   dw 4095, 4095, 4095, 4095   ; note  22
   dw 4043, 3985, 3928, 3872   ; note  23
   dw 3816, 3761, 3708, 3654   ; note  24
   dw 3602, 3550, 3499, 3449   ; note  25
   dw 3400, 3351, 3303, 3256   ; note  26
   dw 3209, 3163, 3118, 3073   ; note  27
   dw 3029, 2985, 2943, 2900   ; note  28
   dw 2859, 2818, 2777, 2738   ; note  29
   dw 2698, 2660, 2622, 2584   ; note  30
   dw 2547, 2510, 2474, 2439   ; note  31
   dw 2404, 2370, 2336, 2302   ; note  32
   dw 2269, 2237, 2204, 2173   ; note  33
   dw 2142, 2111, 2081, 2051   ; note  34
   dw 2022, 1993, 1964, 1936   ; note  35
   dw 1908, 1881, 1854, 1827   ; note  36
   dw 1801, 1775, 1750, 1725   ; note  37
   dw 1700, 1676, 1652, 1628   ; note  38
   dw 1604, 1581, 1559, 1536   ; note  39
   dw 1514, 1493, 1471, 1450   ; note  40
   dw 1429, 1409, 1389, 1369   ; note  41
   dw 1349, 1330, 1311, 1292   ; note  42
   dw 1273, 1255, 1237, 1219   ; note  43
   dw 1202, 1185, 1168, 1151   ; note  44
   dw 1135, 1118, 1102, 1086   ; note  45
   dw 1071, 1056, 1040, 1025   ; note  46
   dw 1011,  996,  982,  968   ; note  47
   dw  954,  940,  927,  914   ; note  48
   dw  900,  888,  875,  862   ; note  49
   dw  850,  838,  826,  814   ; note  50
   dw  802,  791,  779,  768   ; note  51
   dw  757,  746,  736,  725   ; note  52
   dw  715,  704,  694,  684   ; note  53
   dw  675,  665,  655,  646   ; note  54
   dw  637,  628,  619,  610   ; note  55
   dw  601,  592,  584,  576   ; note  56
   dw  567,  559,  551,  543   ; note  57
   dw  535,  528,  520,  513   ; note  58
   dw  505,  498,  491,  484   ; note  59
   dw  477,  470,  463,  457   ; note  60
   dw  450,  444,  437,  431   ; note  61
   dw  425,  419,  413,  407   ; note  62
   dw  401,  395,  390,  384   ; note  63
   dw  379,  373,  368,  363   ; note  64
   dw  357,  352,  347,  342   ; note  65
   dw  337,  332,  328,  323   ; note  66
   dw  318,  314,  309,  305   ; note  67
   dw  301,  296,  292,  288   ; note  68
   dw  284,  280,  276,  272   ; note  69
   dw  268,  264,  260,  256   ; note  70
   dw  253,  249,  245,  242   ; note  71
   dw  239,  235,  232,  228   ; note  72
   dw  225,  222,  219,  216   ; note  73
   dw  212,  209,  206,  203   ; note  74
   dw  201,  198,  195,  192   ; note  75
   dw  189,  187,  184,  181   ; note  76
   dw  179,  176,  174,  171   ; note  77
   dw  169,  166,  164,  162   ; note  78
   dw  159,  157,  155,  152   ; note  79
   dw  150,  148,  146,  144   ; note  80
   dw  142,  140,  138,  136   ; note  81
   dw  134,  132,  130,  128   ; note  82
   dw  126,  125,  123,  121   ; note  83
   dw  119,  118,  116,  114   ; note  84
   dw  113,  111,  109,  108   ; note  85
   dw  106,  105,  103,  102   ; note  86
   dw  100,   99,   97,   96   ; note  87
   dw   95,   93,   92,   91   ; note  88
   dw   89,   88,   87,   86   ; note  89
   dw   84,   83,   82,   81   ; note  90
   dw   80,   78,   77,   76   ; note  91
   dw   75,   74,   73,   72   ; note  92
   dw   71,   70,   69,   68   ; note  93
   dw   67,   66,   65,   64   ; note  94
   dw   63,   62,   61,   60   ; note  95
   dw   60,   59,   58,   57   ; note  96
   dw   56,   55,   55,   54   ; note  97
   dw   53,   52,   52,   51   ; note  98
   dw   50,   49,   49,   48   ; note  99
   dw   47,   47,   46,   45   ; note 100
   dw   45,   44,   43,   43   ; note 101
   dw   42,   42,   41,   40   ; note 102
   dw   40,   39,   39,   38   ; note 103
   dw   38,   37,   36,   36   ; note 104
   dw   35,   35,   34,   34   ; note 105
   dw   33,   33,   33,   32   ; note 106
   dw   32,   31,   31,   30   ; note 107
   dw   30,   29,   29,   29   ; note 108
   dw   28,   28,   27,   27   ; note 109
   dw   27,   26,   26,   25   ; note 110
   dw   25,   25,   24,   24   ; note 111
   dw   24,   23,   23,   23   ; note 112
   dw   22,   22,   22,   21   ; note 113
   dw   21,   21,   20,   20   ; note 114
   dw   20,   20,   19,   19   ; note 115
   dw   19,   19,   18,   18   ; note 116
   dw   18,   17,   17,   17   ; note 117
   dw   17,   16,   16,   16   ; note 118
   dw   16,   16,   15,   15   ; note 119
   dw   15,   15,   14,   14   ; note 120
   dw   14,   14,   14,   13   ; note 121
   dw   13,   13,   13,   13   ; note 122
   dw   13,   12,   12,   12   ; note 123
   dw   12,   12,   11,   11   ; note 124
   dw   11,   11,   11,   11   ; note 125
   dw   11,   10,   10,   10   ; note 126
   dw   10,   10,   10,   10   ; note 127

; Release envelope: attenuation added per 60 Hz tick after note-off;
; 127 ends the note (level 0, tone disabled).
env_release:
   db 1, 1, 1, 2, 2, 3, 3, 4, 4, 6, 6, 7, 8, 9, 10, 11, 12, 127

; Attack: attenuation held at 0 for this many ticks, then sustain.
; Sustain: attenuation +1 every this many ticks.
%define ENV_ATTACK_TICKS 7
%define ENV_SUSTAIN_TICKS 20

; Logical level 0-15 -> YM fixed level 0-15.  Identity; adjust if the
; YM's ~3 dB steps need rebalancing against the SN76489's 2 dB steps.
ym_level_map:
   db 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
