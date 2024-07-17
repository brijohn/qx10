#ifndef MQUEUE_H
#define MQUEUE_H

void mqueue_init();
bool mqueue_put_scancode(uint8_t scancode);
bool mqueue_get_scancode(uint8_t *scancode);
bool mqueue_put_message(uint8_t cmd);
bool mqueue_get_message(uint8_t *cmd);

#endif
