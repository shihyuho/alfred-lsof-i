# alfred-lsof-i

An [Alfred](https://www.alfredapp.com/) 2/3 workflow that easily find and kill the process that is binding the given service name or port number

[Alfred Workflows](http://www.alfredforum.com/topic/9277-what-is-binding-the-port/)

## Usage

1. `lsof-i [46][protocol][@hostname|hostaddr][:service|port]`
	- Supports all [-i] option of [LSOF(8)](https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man8/lsof.8.html)
	
	![](ScreenShot2.png)

2. `lsof-i [service|port]`
	- Or just type a port number
	
	![](ScreenShot1.png)

3. `lsof-i [process]`
	- 	Autocompletes process names
	
	![](ScreenShot3.png)	

4. Press return to kill the selected process.

## License

[WTFPL](http://www.wtfpl.net/about/)
