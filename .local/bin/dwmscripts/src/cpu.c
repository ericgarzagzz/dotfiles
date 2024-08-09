#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<stdio.h>

int main(int argc, char **argv)
{
	char str[100];
	const char d[2] = " ";
	char* token;
	int i = 0,times,lag;
	long int sum = 0, idle, lastSum = 0,lastIdle = 0;
	long double idleFraction;
	
	times = 1; 
	lag = 0; 
		
	while(times>0){
		FILE* fp = fopen("/proc/stat","r");
		i = 0;
		fgets(str,100,fp);
		fclose(fp);
		token = strtok(str,d);
		sum = 0;
		while(token!=NULL){
			token = strtok(NULL,d);
			if(token!=NULL){
				sum += atoi(token);

				if(i==3)
					idle = atoi(token);

				i++;
			}
		}
		idleFraction = 100 - (idle-lastIdle)*100.0/(sum-lastSum);
		printf("%.2Lf %%\n", idleFraction);

		lastIdle = idle;
		lastSum = sum;


		times--;
		sleep(lag);
	}

	return 0;
}
