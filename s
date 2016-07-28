[1mdiff --git a/Image/packedKernel.bin b/Image/packedKernel.bin[m
[1mindex f7fad12..0c3a938 100644[m
Binary files a/Image/packedKernel.bin and b/Image/packedKernel.bin differ
[1mdiff --git a/Image/x64BareBonesImage.img b/Image/x64BareBonesImage.img[m
[1mindex d3e9104..65fe4d6 100644[m
Binary files a/Image/x64BareBonesImage.img and b/Image/x64BareBonesImage.img differ
[1mdiff --git a/Image/x64BareBonesImage.qcow2 b/Image/x64BareBonesImage.qcow2[m
[1mindex e29d9fb..0c6aa3d 100644[m
Binary files a/Image/x64BareBonesImage.qcow2 and b/Image/x64BareBonesImage.qcow2 differ
[1mdiff --git a/Image/x64BareBonesImage.vmdk b/Image/x64BareBonesImage.vmdk[m
[1mindex 972a34d..7f2e6bb 100644[m
Binary files a/Image/x64BareBonesImage.vmdk and b/Image/x64BareBonesImage.vmdk differ
[1mdiff --git a/Kernel/kernel.bin b/Kernel/kernel.bin[m
[1mindex e42eb45..ec95f33 100755[m
Binary files a/Kernel/kernel.bin and b/Kernel/kernel.bin differ
[1mdiff --git a/Kernel/keyboard.c b/Kernel/keyboard.c[m
[1mindex c330a68..93c240f 100755[m
[1m--- a/Kernel/keyboard.c[m
[1m+++ b/Kernel/keyboard.c[m
[36m@@ -7,7 +7,7 @@[m
 #define KEYBOARD_DATA_PORT		0x60[m
 #define KEYBOARD_STATUS_PORT	0x64[m
 [m
[31m-#define BUFFER_SIZE 64[m
[32m+[m[32m#define BUFFER_SIZE 4[m
 [m
 static void key_pressed(char keycode);[m
 static int isalpha(char keycode);[m
[36m@@ -17,6 +17,7 @@[m [mstatic unsigned char kb_buffer[BUFFER_SIZE] = { EMPTY };[m
 static int write_pos = 0;[m
 static int read_pos = 0;[m
 [m
[32m+[m
 static int shift_on = 0;[m
 static int caps_lock_on = 0;[m
 [m
[36m@@ -51,7 +52,6 @@[m [mvoid key_pressed(char keycode) {[m
 	}[m
 [m
 	if (!(keycode & KEY_RELEASED)) { // escribis cuando este mantenida la tecla[m
[31m-		//putnumber(keycode, RED);[m
 [m
 		int shift = (isalpha(keycode) && caps_lock_on);[m
 [m
[36m@@ -61,6 +61,10 @@[m [mvoid key_pressed(char keycode) {[m
 [m
 		unsigned char ascii = keyboard_map[shift][(int)keycode];[m
 		ncPrintChar(ascii);[m
[32m+[m		[32mkb_buffer[write_pos++]=ascii;[m
[32m+[m		[32mif (write_pos==BUFFER_SIZE)[m
[32m+[m			[32mwrite_pos=0;[m
[32m+[m[41m		[m
 	}	[m
 }[m
 [m
[1mdiff --git a/Kernel/keyboard.c~ b/Kernel/keyboard.c~[m
[1mindex 8622d32..335adfa 100755[m
[1m--- a/Kernel/keyboard.c~[m
[1m+++ b/Kernel/keyboard.c~[m
[36m@@ -7,7 +7,7 @@[m
 #define KEYBOARD_DATA_PORT		0x60[m
 #define KEYBOARD_STATUS_PORT	0x64[m
 [m
[31m-#define BUFFER_SIZE 64[m
[32m+[m[32m#define BUFFER_SIZE 4[m
 [m
 static void key_pressed(char keycode);[m
 static int isalpha(char keycode);[m
[36m@@ -17,6 +17,7 @@[m [mstatic unsigned char kb_buffer[BUFFER_SIZE] = { EMPTY };[m
 static int write_pos = 0;[m
 static int read_pos = 0;[m
 [m
[32m+[m
 static int shift_on = 0;[m
 static int caps_lock_on = 0;[m
 [m
[36m@@ -50,8 +51,7 @@[m [mvoid key_pressed(char keycode) {[m
 			return;[m
 	}[m
 [m
[31m-	if (!(keycode & KEY_RELEASED)) {[m
[31m-		//putnumber(keycode, RED);[m
[32m+[m	[32mif (!(keycode & KEY_RELEASED)) { // escribis cuando este mantenida la tecla[m
 [m
 		int shift = (isalpha(keycode) && caps_lock_on);[m
 [m
[36m@@ -60,7 +60,15 @@[m [mvoid key_pressed(char keycode) {[m
 		}[m
 [m
 		unsigned char ascii = keyboard_map[shift][(int)keycode];[m
[31m-		ncPrintChar(ascii);[m
[32m+[m		[32m//ncPrintChar(ascii);[m
[32m+[m		[32mkb_buffer[write_pos++]=ascii;[m
[32m+[m		[32mif (write_pos==BUFFER_SIZE)[m
[32m+[m			[32mwrite_pos=0;[m
[32m+[m[41m	[m
[32m+[m[41m				[m
[32m+[m[41m		[m
[32m+[m			[32mncPrint(kb_buffer);[m
[32m+[m[41m		[m
 	}	[m
 }[m
 [m
[1mdiff --git a/Kernel/keyboard.o b/Kernel/keyboard.o[m
[1mindex a9b2f5f..d0234ba 100644[m
Binary files a/Kernel/keyboard.o and b/Kernel/keyboard.o differ
[1mdiff --git a/Userland/0001-sampleDataModule.bin b/Userland/0001-sampleDataModule.bin[m
[1mindex b857884..0584d1c 100644[m
Binary files a/Userland/0001-sampleDataModule.bin and b/Userland/0001-sampleDataModule.bin differ
