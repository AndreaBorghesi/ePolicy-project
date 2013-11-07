import sys
import getopt
from lxml import etree as ET

tree = ET.parse("./netlogo_experiment_setup.xml")
root = tree.getroot()

# parameters MUST be passed only as long flags (--opt arg)
try:
	opts, args = getopt.getopt(sys.argv[1:], "i:c:", [
								# agent '0' parameters
								"M2_Disposizione=", "Consumo_medio_annuale_KWh=", "Budget_Medio_MiliaiaEuro=", 
								"Media%_copertura_consumi_richiesta=", "Aumento_%annuo_consumi=",
								# PV tech and general sim.
								"Riduzione_anno_%costo_pannello=",
								"Perdita_efficienza_annuale_pannello=", "Tecnologia_Pannello=", 
								"Manutenzione_anno_%costo_totale=", "variazione_annuale_prezzi_elettricita=",
								"Anni_Restituzione_Prestiti=", "Percentuale_Interessi_Prestito=",
								# regional incentives parameters
								"Tipo_inc_reg=", "BudgetRegione=", "BudgetRegione2008=", "BudgetRegione2009=",
								"BudgetRegione2010=", "BudgetRegione2011=", "BudgetRegione2012=","BudgetRegione2013=",
								"Probfinanz=", "InterBanca=", "Accettato=", "InterRegione=",
								"Anni_Restituzione_mutuo_regione=", "Anni_Restituzione_mutuo_banca=",
								"FallimentoMutuo=", "PercMin=", "PercMax=", "InfluenzaRate=",
								# social interaction
								"Sensibilita=", "Raggio=", 
								# ROE
								"ROE_minimo_desiderato=",
								# knowledge diffusion
								"Tipo_variazione_conoscenza_PV=", "Diffusione_Conoscenza_Iniziale=", 
								"Coeff_Variazione_Diffusione="
								# simulation parameters that could be considered later
								# "NumeroAgenti=", "%_Incentivi_Installazione=", "Tasso_lordo_rendimento_BOT=",
								# "Incentivi_Dinamici=", "Incentivi_Installazione=",
								# "Irradiazione_media_annua_kwh_kwp=", "Costo_Medio_kwP=",
								])
except getopt.GetoptError, e:
	print "Error: {}\n".format(str(e.msg))
	sys.exit(2)

for opt, arg in opts:
	if opt == "-c":
		nrun=arg
		print nrun
	else:
		for experiment in root.iter("experiment"):
			for enumeratedValueSet in experiment.xpath("./enumeratedValueSet[@variable='{}']".format(str(opt[2:]))):
				for parameter in enumeratedValueSet:
					if (opt[2:] == "Tecnologia_Pannello") or (opt[2:] == "Tipo_inc_reg") or (opt[2:] == "Tipo_variazione_conoscenza_PV"):
						parameter.attrib['value']="\"{}\"".format(arg)
					else:
						parameter.attrib['value']=arg
			
#with open("./netlogo_experiment_setup_{}.xml".format(str(nrun)), 'w+') as f:
#	f.write(ET.tostring(tree, encoding="UTF-8",
#	                 xml_declaration=True,
#	                 pretty_print=True,
#	                 doctype='<!DOCTYPE experiments SYSTEM "behaviorspace.dtd">'))
			

