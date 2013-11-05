import sys
import getopt
import xml.etree.ElementTree as ET

tree = ET.parse("netlogo_experiment_setup.xml")
root = tree.getroot()

# command line arguments MUST be passed only as long flags (--opt arg)
try:
	opts, args = getopt.getopt(sys.argv[1:], "", [
								# agent '0' parameters
								"M2_Disposizione=", "Consumo_medio_annuale_KWh=", "Budget_Medio_MiliaiaEuro=", 
								"Media%_copertura_consumi_richiesta=", "Aumento_%annuo_consumi=",
								# PV tech and general sim.
								"Riduzione_anno_%costo_pannello==",
								"Perdita_efficienza_annuale_pannello=", "Tecnologia_Pannello=", 
								"Manutenzione_anno_%costo_totale=", "variazione_annuale_prezzi_elettricita=",
								"Anni_Restituzione_Prestiti=", "Percentuale_Interessi_Prestito="
								# regional incentives parameters
								"fr=", "BudgetRegione=", "BudgetRegione2008=", "BudgetRegione2009=",
								"BudgetRegione2010=", "BudgetRegione2011=", "BudgetRegione2012=", "BudgetRegione2013=",
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
except getopt.GetoptError:
	sys.exit(2)

for node in root.findall("./enumeratedValueSet"):
	for opt, arg in opts:
		if node.attrib['variable']==str(opt[2:]):  # cut -- from opt 
			for parameter in node:
				print parameter.tag, parameter.attrib
				parameter.attrib['value']=arg
			
tree.write("netlogo_experiment_setup.xml")
			


