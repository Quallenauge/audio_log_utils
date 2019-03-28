#define LOG_TAG "log_utils"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <cutils/log.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

#include <acdb_data.h>

int hal_log_mask[255];

typedef int snd_device_t;
int platform_get_snd_device_acdb_id(snd_device_t snd_device);

void register_for_dynamic_logging(char *name){
	ALOGE("%s - %s", __func__, name);
}

void log_utils_init(void){
	int i=0;
	for(i=0; i<255; i++){
		hal_log_mask[i]=1;
	}
}

void log_utils_deinit(void){

}

void dump(){
	ALOGE("%s", __func__);
	ALOGE("    <acdb_ids>");
    int dev;
    for (dev = 1; dev < SND_DEVICE_MAX; dev++)
    	ALOGE("        <device name=\"%s\" acdb_id=\"%i\"/>\n", device_table[dev], platform_get_snd_device_acdb_id(dev));
    ALOGE("    </acdb_ids>\n");
}
