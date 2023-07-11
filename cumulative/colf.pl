:- lib(fd).
:- lib(edge_finder).

colf(L):-

	StartActivity = [StartBucato, StartAsciugareBucato, StartStirareBucato, StartLavarePiatti, StartPreparareImpasto, StartLievito, StartPreForno, StartForno, StartPulireCasa],
	StartActivity::[0..200],
	LimitePotenza = 3000,
	DurataActivity = [DurataBucato, DurataAsciugatura, DurataStiro, DurataLavarePiatti, DurataImpasto, DurataLievito, DurataPreForno,DurataForno, DurataPulireCasa],
	DurataBucato = 45,
	DurataAsciugatura = 60,
	DurataStiro = 60,
	DurataLavarePiatti = 40,
	DurataImpasto = 15,
	DurataLievito::[60..120],
	DurataPreForno=5,
	DurataForno=15,
	DurataPulireCasa=120,
	Risorse = [Lavatrice, Asciugatrice, FerroDaStiro, Lavastoviglie, PreparazioneImpasto,Lievitazione, PreForno, Forno, PulireCasa],
	Lavatrice = 1700,
	Asciugatrice = 1000,
	FerroDaStiro = 2000,
	Lavastoviglie = 1800,
	PreparazioneImpasto = 0,
	Lievitazione = 0,
	PreForno = 2000,
	Forno = 2000,
	PulireCasa = 0,
	
	% vincoli di concorrenza
	disjunctive([StartStirareBucato, StartPreparareImpasto, StartPulireCasa], [DurataStiro, DurataImpasto, DurataPulireCasa]),
		 
	% vincoli bucato
	StartAsciugareBucato #>= StartBucato+DurataBucato,
	StartStirareBucato #>= StartAsciugareBucato+DurataAsciugatura,
	
	% vincoli preparazione pizza
	StartLievito#>= StartPreparareImpasto+DurataImpasto,
	StartForno#>= StartLievito+DurataLievito,
	StartForno#>= StartPreForno+DurataPreForno,
	StartForno#= StartPreForno+DurataPreForno,

	StartPulireCasa#=<80,
	StartStirareBucato#=<140,
	StartForno+DurataForno#=<200,
	
	cumulative(StartActivity, DurataActivity, Risorse, LimitePotenza),
	
	append(StartActivity, [DurataLievito], L),
	labeling(L).
	
	
	
