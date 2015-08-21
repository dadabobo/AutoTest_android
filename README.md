# AutoTest_android

This AutoTest has linux and windows

linux:

	./run.sh x y
	x = 0/1 (0-get android log, 1-didn't get android log)
	y = 1...(this is test repeat times.sum times = 1000*y)
	
	you can run like :./run.sh 
	this meanings ./run.sh 0 10
	
	logs:
	monkeyrunner log save to path : ./logs
	android log save to path : ./logs
	
windows:

	run.bat x y
	x = 0/1 (0-get android log, 1-didn't get android log)
	y = 1...(this is test repeat times.sum times = 1000*y)
	
	you can run like :run.bat
	this meanings run.bat 0 10
	
	logs:
	monkeyrunner log save to path : ./logs
	android log save to path : ./slog/windows/logs