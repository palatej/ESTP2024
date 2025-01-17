jws<-rjd3workspace::.jws_load(system.file('workspaces', 'test.xml', package='rjd3workspace'))
ws<-rjd3workspace::read_workspace(jws, TRUE)
jws2<-rjd3workspace::.jws_make_copy(jws)
rjd3providers::set_spreadsheet_paths("c:/data/excel/new")
rjd3workspace::.jws_refresh(jws2, 'Complete')
ws2<-rjd3workspace::read_workspace(jws2)


SA1<-ws$processing$`SAProcessing-1`
SA2<-ws2$processing$`SAProcessing-1`
idx<-3
sa1=SA1[[idx]]
sa2<-SA2[[idx]]
dely<-sa2$results$final$series$data-sa1$results$final$series$data
delsa<-sa2$results$final$sa$data-sa1$results$final$sa$data
delproc<-delsa-dely
print(window(dely, start=2018))
print(window(delsa, start=2018))
print(window(delproc, start=2018))

all<-ts.union(dely, delsa, delproc)

print(window(all, start=2018))
ts.plot(window(all, start=2010), col=c('red', 'gray', 'blue'), type='b')
