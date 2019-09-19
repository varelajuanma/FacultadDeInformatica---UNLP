Program Uno;
	type tpuntero= ^integer;
	var mipuntero: tpuntero;
	var i:integer;
	var h:integer;
Begin
	i:=3;
	mipuntero:=nil;
	new(mipuntero);
	mipunterno^:=i;
	h:= mipuntero^+i;
	dispose(mipuntero);
	write(h);
	i:= h- mipuntero;
End.