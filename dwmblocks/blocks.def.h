//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"    ", "pamixer --get-volume | awk '{print $0 \"%\"}'",	30,		10},
	{"    ", "xkblayout-state print \"%s\"",			5,		0},
	{"    ", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,	0},
	{"    ", "~/.local/bin/dwmscripts/build/dwmscripts cpu",	5,		0},
	{"    ", "date '+%F %H:%M'",					5,		0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " ";
static unsigned int delimLen = 5;
