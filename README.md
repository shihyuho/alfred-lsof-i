# alfred-lsof-i

An [Alfred](https://www.alfredapp.com/) 2/3 workflow that easily find and kill the process that is binding the given service name or port number

## Usage

![](ScreenShot1.png)

![](ScreenShot2.png)

1. Type `lsof-i [46][protocol][@hostname|hostaddr][:service|port]`
	- see more @ [LSOF(8) manual page -i option](https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man8/lsof.8.html)

2. Press return to kill the selected process.

## License

[WTFPL](http://www.wtfpl.net/about/)
