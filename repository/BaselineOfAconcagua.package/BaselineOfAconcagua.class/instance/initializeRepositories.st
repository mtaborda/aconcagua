initialize - release
initializeRepositories

	repositories := Dictionary new.
	repositories at: #pharo40 put: #'github://mtaborda/aconcagua:v4.1.0/repository'.
	repositories at: #pharo50 put: #'github://mtaborda/aconcagua:v5.0.0/repository'.
	repositories at: #pharo60 put: #'github://ba-st/aconcagua:v6.0.0/repository'
