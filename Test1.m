
die=dielectric('Air');
z0=50;
die1=dielectric('Teflon');
die2=dielectric('FR4');
die3=dielectric('Plexiglas');
die4=dielectric('Polystyrene');
die5=dielectric('Taconic RF-35');
die6=dielectric('RO4725JXR');
die7=dielectric('RO4730JXR');
die8=dielectric('Foam');
die9=dielectric('TMM3');
die10=dielectric('Fused quartz');
die11=dielectric('E glass');
die12=dielectric('TMM4');
die13=dielectric('TMM6');
die14=dielectric('TMM10');
die15=dielectric('TMM10i');
freq= 2400000000;
insetpatch=patchMicrostripInsetfed('Substrate', die5);
z=impedance(insetpatch, freq);
info(insetpatch);
beamwidth(insetpatch,2.4e9, 0,1:1:360);

charge(insetpatch,freq);

current(insetpatch,freq);



mesh(insetpatch);

show(insetpatch);

EHfields(insetpatch, freq);

pattern(insetpatch, 2.4e9);

MicrostripAntenna= PCBServices.MayhewWriter;

PCB=pcbStack(insetpatch);



MicrostripAntenna.BoardProfileFile= 'PCB Profile';



PcbWriter=PCBWriter(PCB, MicrostripAntenna);

 
gerberWrite(PcbWriter);


