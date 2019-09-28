# 
# El padre puede terminar antes que los hijos
#

import os, time
hijos = 0
print '\n\n\nSoy el PROCESO', os.getpid() , 'y tengo', hijos, 'hijos\n'
while True:
	newpid = os.fork()
	if newpid == 0:
		time.sleep(30)
		print 'El hijo', os.getpid(), 'se va a jugar a la play'
		exit(0)
	else:
		hijos = hijos + 1
		print 'Tuve un hijo!!!! Se llama', newpid

	if raw_input( ) == 'q': break

print 'Bueno, hasta aca llegue. Me voy a dormir. Ya con', hijos ,'hijos es suficiente'



