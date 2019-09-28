# 
# El padre espera que terminen sus hijos antes de retirarse
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

print '\n\n\nVAYAN A JUGAR A LA PELOTA!!!!'

while hijos > 0:
	os.wait()
	print 'joya, uno menos para cuidar!!!\n'
	hijos = hijos - 1

print '\n\nListo, se fueron todos, me voy a dormir'




