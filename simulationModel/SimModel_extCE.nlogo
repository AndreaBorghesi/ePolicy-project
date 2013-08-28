;;DEFINIZIONE VARIABILI GLOBALI DEL MODELLO
globals [ wacc m2Kwp  count_tick scala_dim_impianto time anno number durata_impianti 
  count_pf count_pf2012 count_pf2013 count_pf2014 count_pf2015 count_pf2016  prezzi_minimi_gsef1 prezzi_minimi_gsef2 prezzi_minimi_gsef3  
  random_bgt random_m2 random_ostinazione random_consumo kW2012 kW2013 kW2014 kW2015 kW2016 kWTOT NAgentiFINAL  
  INCENTIVO_INST2012 INCENTIVO_INST2013 INCENTIVO_INST2014 INCENTIVO_INST2015 INCENTIVO_INST2016 INCENTIVO_INSTOT 
  INCENTIVO_PRO2012 INCENTIVO_PRO2013 INCENTIVO_PRO2014 INCENTIVO_PRO2015 INCENTIVO_PRO2016 INCENTIVO_PROTOT 
  Budget2012 Budget2013 Budget2014 Budget2015 Budget2016 Budget2017;per tenere traccia del budget annuale, spese più ricavi
  TOT_SPESA2012 TOT_SPESA2013 TOT_SPESA2014 TOT_SPESA2015 TOT_SPESA2016 TOT_SPESA 
  
  r2012 r2013 r2014 r2015 r2016 ;percentuale agenti che non sono morti
  BudgetCorrente;quanto è rimasto del budget iniziale
  totreg;quanti hanno usufruito degli incentivi regionali   
  percreg; percentuale di chi ha usufruito   
  totdied;quanti scelgono di non investire
  totnegsoldi;quanti non fanno investimento a causa di fattori economici
  perctotnegsoldi; percentuale di quello sopra
  percneg2012 percneg2013 percneg2014 percneg2015 percneg2016
  totneg2012 totneg2013 totneg2014 totneg2015 totneg2016
  percnegativa;percentuale di quante hanno rifutato l'investimento
  percpositive;di quanti hanno investito
  
  ;; estensioni per inserire nel modello i vari conti energia
  kw_installed_yearly ;; tengo traccia dei kw installati ogni anno
  kw_installed_semester ;; tengo traccia dei kw installati ogni semestre
  kw_sum ;; contatore per i kw di ogni semestre 
  count_pf2007 count_pf2008 count_pf2009 count_pf2010 count_pf2011 
  kW2007 kW2008 kW2009 kW2010 kW2011    
  INCENTIVO_INST2007 INCENTIVO_INST2008 INCENTIVO_INST2009 INCENTIVO_INST2010 INCENTIVO_INST2011 
  INCENTIVO_PRO2007 INCENTIVO_PRO2008 INCENTIVO_PRO2009 INCENTIVO_PRO2010 INCENTIVO_PRO2011 
  Budget2008 Budget2007 Budget2009 Budget2010 Budget2011 
  TOT_SPESA2007 TOT_SPESA2008 TOT_SPESA2009 TOT_SPESA2010 TOT_SPESA2011
  percneg2007 percneg2008 percneg2009 percneg2010 percneg2011
  totneg2007 totneg2008 totneg2009 totneg2010 totneg2011
  r2007 r2008 r2009 r2010 r2011
  ;; ogni agente può accedere a prezzi minimi diversi in base all'anno di entrata in esercizio --> lista di 3 elementi, per le diverse quantità di energia immessa
  ;; per maggiore facilità di programmazione questi valori (3 per anno) sono inseriti in testa alla lista prezzi_minimi_gse[] ogni anno, quindi i valori che un agente deve usare
  ;; sono i primi 3 presenti in lista, posizioni 0,1,2 - nella lista sono inoltre salvati in ordine opposto rispetto ai file da cui sono letti, ovvero in posizione 0 ci sono i 
  ;; prezzi minimi per gli impianti di dimensione maggiore (prezzi minori) e in pos.2 quelli per gli impianti più piccoli
  prezzi_minimi_gse ;; 
  ;; ogni anno i prezzi dell'energia elettrica al consumatore finale cambiano --> lista di 5 elementi, un per ogni fascia di consumo individuata nella versione
  ;; inziali di Croce - la gestione di questi costi è analoga a quella dei prezzi minimi garantiti dal gse
  costo_kwh_consumo
  ;; variabili per tenere traccia del numero totale di kw istallati con i diversi Conti  Energia
  kW_2CE
  kW_3CE
  kW_5CE
  kW_4CE
  ;; variabili per tenere traccia del numero di kW installati con i diversi CE ogni anno
  ;; anni del Secondo CE
  kW_2CE_2007
  kW_2CE_2008
  kW_2CE_2009
  kW_2CE_2010
  kW_2CE_2011 ;; solo primo semestre
  kW_3CE_2011 ;; solo primo semestre
  kW_4CE_2011 ;; solo secondo semestre
  kW_4CE_2012 ;; solo primo semestre
  kW_5CE_2012 ;; solo secondo semestre
  kW_5CE_2013 
  ;; variabili per tenere traccia del numero di agenti che hanno installato i pannelli con i diversi CE
  count_pf_2CE
  count_pf_3CE
  count_pf_4CE
  count_pf_5CE
  ;; variabili per tenere traccia del numero totale di kw istallati divisi per fascia di potenza
  kW_1FP kW_2FP kW_3FP kW_4FP kW_5FP kW_6FP
  ;; variabili per tenere traccia del numero totale di kw istallati divisi per fascia di potenza ogni anno
  kW_1FP_2007 kW_1FP_2008 kW_1FP_2009 kW_1FP_2010 kW_1FP_2011 kW_1FP_2012 kW_1FP_2013
  kW_2FP_2007 kW_2FP_2008 kW_2FP_2009 kW_2FP_2010 kW_2FP_2011 kW_2FP_2012 kW_2FP_2013
  kW_3FP_2007 kW_3FP_2008 kW_3FP_2009 kW_3FP_2010 kW_3FP_2011 kW_3FP_2012 kW_3FP_2013
  kW_4FP_2007 kW_4FP_2008 kW_4FP_2009 kW_4FP_2010 kW_4FP_2011 kW_4FP_2012 kW_4FP_2013
  kW_5FP_2007 kW_5FP_2008 kW_5FP_2009 kW_5FP_2010 kW_5FP_2011 kW_5FP_2012 kW_5FP_2013
  kW_6FP_2007 kW_6FP_2008 kW_6FP_2009 kW_6FP_2010 kW_6FP_2011 kW_6FP_2012 kW_6FP_2013
  ;; variabili per tenere traccia del numero totale di impianti PV istallati divisi per fascia di potenza
  count_pf_1FP count_pf_2FP count_pf_3FP count_pf_4FP count_pf_5FP count_pf_6FP
  ;; variabili per tenere traccia del numero totale di impianti istallati divisi per fascia di potenza ogni anno
  count_pf_1FP_2007 count_pf_1FP_2008 count_pf_1FP_2009 count_pf_1FP_2010 count_pf_1FP_2011 count_pf_1FP_2012 count_pf_1FP_2013
  count_pf_2FP_2007 count_pf_2FP_2008 count_pf_2FP_2009 count_pf_2FP_2010 count_pf_2FP_2011 count_pf_2FP_2012 count_pf_2FP_2013
  count_pf_3FP_2007 count_pf_3FP_2008 count_pf_3FP_2009 count_pf_3FP_2010 count_pf_3FP_2011 count_pf_3FP_2012 count_pf_3FP_2013
  count_pf_4FP_2007 count_pf_4FP_2008 count_pf_4FP_2009 count_pf_4FP_2010 count_pf_4FP_2011 count_pf_4FP_2012 count_pf_4FP_2013
  count_pf_5FP_2007 count_pf_5FP_2008 count_pf_5FP_2009 count_pf_5FP_2010 count_pf_5FP_2011 count_pf_5FP_2012 count_pf_5FP_2013
  count_pf_6FP_2007 count_pf_6FP_2008 count_pf_6FP_2009 count_pf_6FP_2010 count_pf_6FP_2011 count_pf_6FP_2012 count_pf_6FP_2013
  ;; agenti che non istallano impianto, divisi per classe di potenza
  morti_FP_1 morti_FP_2 morti_FP_3 morti_FP_4 morti_FP_5 morti_FP_6
  ;; informazioni per testare il funzionamento di valori casuali
  rand_FP1 rand_FP2 rand_FP3 rand_FP4 rand_FP5 rand_FP6
  
  ;; per decidere se realizzare l'impianto anche sulla base del roe stimato
  roe_minimo   ;; parametro selezionabile da interfaccia, rappresenta il Return On Equity minimo per il quale gli agenti scelgono di realizzare l'impianto
  ;; variabili per tenere traccia degli impianti non realizzati a causa di ROE insufficiente
  totnegroe
  totneg_roe2007 totneg_roe2008 totneg_roe2009 totneg_roe2010 totneg_roe2011 totneg_roe2012 totneg_roe2013 totneg_roe2014 totneg_roe2015 totneg_roe2016
  
  ;;variabili per calcolare il roe/roe_stimato medio anche considerando gli agenti che durante l'esecuzione sono morti -> il roe mi interessa in ogni caso, a prescindere da eccedenze 
  ;di spazio o costi, oppure per non sovrastimarlo considerando solo quello degli agenti che hanno raggiunto la soglia minima
  sum_roe_morti_2007 sum_roe_morti_2008 sum_roe_morti_2009 sum_roe_morti_2010 sum_roe_morti_2011 sum_roe_morti_2012 sum_roe_morti_2013
  sum_roe_morti_2014 sum_roe_morti_2015 sum_roe_morti_2016
  sum_roe_stimato_morti_2007 sum_roe_stimato_morti_2008 sum_roe_stimato_morti_2009 sum_roe_stimato_morti_2010 sum_roe_stimato_morti_2011 sum_roe_stimato_morti_2012 sum_roe_stimato_morti_2013
  sum_roe_stimato_morti_2014 sum_roe_stimato_morti_2015 sum_roe_stimato_morti_2016
  sum_roe_stimato_morti_CE_2 sum_roe_stimato_morti_CE_3 sum_roe_stimato_morti_CE_4 sum_roe_stimato_morti_CE_5
  
  ;; variabili per simulare il grado di diffusione della conoscenza della tecnologia e incentivi PV --> se gli agenti non sanno che esiste la possibilità o la convenienza di installare
  ;; un impianto non prendono nemmeno in considerazione l'idea
  percentuale_conoscenza_PV  ;; la percentuale di agenti che ogni anno è a conoscenza delle possibilità offerte dal PV: il valore è inizialmente settato tramite interfaccia grafica
  ; Tipo_variazione_conoscenza_PV variabile globale settabile da interfaccia che indca come cambia annualmente la percentuale di conoscenza, aumento lineare, quadratico o cubico
  coeff_variazione_conoscenza_PV  ;; coefficiente che esprime quanto velocemente cambia la conoscenza ogni anno
  ;; variabili per tenere traccia del numero di agenti che falliscono a causa della mancanza di conoscenza
  morti_conoscenza_2007 morti_conoscenza_2008 morti_conoscenza_2009 morti_conoscenza_2010 morti_conoscenza_2012 morti_conoscenza_2013 morti_conoscenza_2011
  morti_conoscenza_2014 morti_conoscenza_2015 morti_conoscenza_2016
]

;; DEFINIZIONE AGENTI E ATTRIBUTI AGENTI
breed [pf] ;; pf-> normale agente che installa pannelli 

pf-own [id consumo_medio_annuale budget %cop_cosumi M2disposizione dimensione_impianto tipologia_impianto potenza_impianto fascia_potenza kw_annui_impianto costo_impianto %ostinazione influenza
  ridimensionamento prestito importo_prestito interessi_prestito rata_annuale_prestito  kw_autoconsumo kw_immessi kw_prelevati  
  anno_realizzazione semestre_realizzazione vita_impianto Data_termine_incentivi tariffa_incentivante tariffa_autoconsumo tariffa_omnicomprensiva 
  ricavi_autoconsumo ricavi_vendita ricavi_incentivi costi_energia_prelevata  costi_tot_energia_prelevata 
  flusso_cassa flusso_cassa_attualizzato flusso_cassa_cumulato  flusso_cassa_attualizzato_cumulato
  van PBT roi% roe% incentivo_installazione
   
  freg;finanziamento regionale, se si fa finanziare o no dalle regione
  pfin;ercentuale finanziamento
  ifin;incentivo finanziamtno(quanto risparmio, solo con modalità asta)
  intRegione; quanto pago di interessi alla regione(solo se rotazione)  
  iregg;quanto la regione paga di interessi alla banca    (caso di conto interessi) 
  rataReg;rata da dare allla regione in caso di rotazione
  rataBanca
  ratepagate; quante rate ha pagato alla regione in caso di rotazione
  guadagnobanca; quanto ci guadagna la banca con gli interessi
  fallito;se non riesce a pagare il mututo
  morto
  initbudget;budget di partenza
  initosti;ostinaz iniziale
  valutaincentivi
  mortoxm2
  
  ;; parametri per stimare il ROE per decidere se effettuare l'investimento
  stima_flusso_cassa_cumulato  ;; stima della somma dei flussi di cassa 
  stima_flusso_cassa_attualizzato_cumulato  ;; stima della somma dei flussi di cassa, valore attualizzato
  roe_stimato ;;stima - da confrontare con quello effettivamente calcolato roe%
  ;; i seguenti parametri sono esplicitati per facilitare le operazioni di test
  stima_ric_incentivo
  stima_ric_autoconsumo
  stima_ric_vendita
  stima_van
  stima_kw_immessi
  stima_kw_prelevati
  stima_kw_autoconsumo
  stima_consumo_medio_annuale
  stima_kw_annui_impianto
  ;; estensioni per inserire nel modello i vari conti energia
  conto_energia ;; il conto energia nel quale rientra ogni agente pf (primo--> non implementato, secondo-->2, terzo-->3, quarto-->4, quinto-->5)
  
  flag_roe ;variabile per tenere traccia degli agenti che non installano a causa di roe insufficiente e non per problemi di eccedenza costi, etc.
  flag_sum_roe_morti
  flag_sum_roe_stimato_morti
  
]
 
breed [ar] ;; ar-> agente unico che rappresenta la regione
 
ar-own [
 
]

;;PROCEDURA SETUP INIZIALIZZA VARIABILI GLOBALI, GRAFICO roe E GENERA IL PRIMO SET DI AGENTI
to setup
  __clear-all-and-reset-ticks
  
  ;; questi costi sono ancora quelli del simulatore originale, relativi al 2011  - vecchi valori croce
;  set costo_kwh_fascia1 0.278
;  set costo_kwh_fascia2 0.162
;  set costo_kwh_fascia3 0.194
;  set costo_kwh_fascia4 0.246
;  set costo_kwh_fascia5 0.276
  set costo_kwh_consumo []
  set prezzi_minimi_gse []
  output-print (word "---------------------------------------------------------------------------------")
  output-print (word "-----------------------------------INIZIO SIMULAZIONE----------------------------")
  set_global
  calcola_prezzi_minimi_gse
  calcola_prezzi_elettricita_consumatore
  output-print (word "NUMERO AGENTI PER SEMESTRE: "NAgentiFINAL)
  output-print (word "PREVISTA VARIAZIONE TARIFFE INCENTIVANTI SULLA PRODUZIONE: " Varia_Tariffe_Incetivanti )
  output-print (word "PREVISTI INCENTIVI INSTALLAZIONE: " Incentivi_Installazione )
  if (Varia_Tariffe_Incetivanti)
  [
    output-print (word "PERCENTUALE VARIAZIONE: "  %_Variazione_Tariffe "%" )
  ]
  if (Incentivi_Installazione)
  [
    output-print (word "PERCENTUALE INCENTIVI INSTALLAZIONE: "  %_Incentivi_Installazione"%" )
  ]
  output-print (word "IRRADIAZIONE MEDIA ANNUA: " Irradiazione_media_annua_kwh_kwp" kWH_per_kWp" )
  output-print (word "LETTURA DA SERIE STORICHE: " LeggiSerieStoriche  )
  output-print (word "RIDUZIONE ANNUA COSTO PANNELLO: " Riduzione_anno_%costo_pannello "%")
  output-print (word "VARIAZIONE ANNUALE PREZZI ELETTICITA': "variazione_annuale_prezzi_elettricita  "%") 
  output-print (word "----------------------------------------------------------------------------------")
  set BudgetCorrente BudgetRegione * 1000000;inizializzo quantità finanziamenti rimasti
  setup_plot_PBT
  create_ar  ;;procedura per creare un agente associato alla regione, quindi uno solo per simulazione
  create_pf
  aggiorna_kw_semestre
end

;; creo un agente che rappresenta la regione e può, ad esempio, modificare il budget annuale
to create_ar
  ask one-of patches
  [
    sprout-ar 1 [set color yellow] 
    
    output-print (word ">>>>>>>>>> CREATO AR<<<<<<<<<" )
  ]
end

;; PROCEDURA STEP ESECUTIVO AGGIORNA IL TEMPO SIMULATO, GLI IMPIANTI, I CONSUMI, I RICAVI, IL GRAFICO pbt,  CREA GLI ALTRI SET DI AGENTI SINO AL SECONDO SEMESTRE 2016,
;; DETERMINA CONDIZIONE DI STOP
to go
  tick
  set count_tick count_tick + 1
  set time time + 1 
  aggiorna_impianti
  aggiorna_consumi
  aggiorna_ricavi
  update_plot_PBT 
  aggiorna_budget
  
  ;; LA SIMULAZIONE SI INTERROMPE PER PERMETTERE ALL'UTENTE DI SETTARE EVENTUALI STRUMENTI INCENTIVANTI 
  if (anno <= 2013 );creo altri agenti
  [
    if (Incentivi_Dinamici)
    [
      output-print    (word "--------------------------------------------------------------------------------------------------------------------------------------------------------")
      output-print (word "ANNO " anno " SEMESTRE " time" ----------------------------SETTA INCENTIVI : " Incentivi_Installazione "--------------------------------------------")
      user-message (word "HAI 10 SECONDI DA QUANDO PREMI OK PER SETTERA GLI STRUMENTI INCENTIVANTI ANNO: " anno " SEMESTRE " time)
      wait 10
      if(Incentivi_Installazione)
      [
        output-print (word "PERCENTUALE INCENTIVI INSTALLAZIONE: "  %_Incentivi_Installazione"%" )
      ]
      if (Varia_Tariffe_Incetivanti)
      [
        output-print (word "PERCENTUALE VARIAZIONE INCENTIVI: "  %_Variazione_Tariffe "%" )
      ]
      output-print (word "--------------------------------------------------------------------------------------------------------------------------------------------------------")
    ]
    create_pf
    aggiorna_kw_semestre
  ]
  
  if(time = 2)
  [ 
    aggiorna_kw_annui
    aggiorna_diffusione_conoscenza  ;; ogni il livello di diffusione della conoscenza relativa al fotovoltaico cambia    
  ]
  
  if (anno = 2014);ora non creo più nulla faccio solo evolvere
  [
    calcola_rapporto
    if count_pf = 0 [ set count_pf 1 ] ;; non crea problemi di divisione per zero nel caso di simulazioni dove nessun agente riesce a installare impianti
    set percreg precision ((totreg / count_pf) * 100) 2
  ]
  if (anno = 2013 + durata_impianti + 1   and time = 2 );fine simulazione
  [ 
    aggiorna_incentivi_prod
    aggiorna_incentivi_tot
    ; stampa_agenti  ;; commentato per non appesantire output, usare in fase di debug
    ;;stampa_resoconto
    update_plot_roe
    update_plot_kw_bars
    
    ;;print_simulation_info
    output-print (word "--------------------------------------------------------------------------------------------------------------------------------------------------------")
    output-print (word "---------------------------------------------------------------------FINE SIMULAZIONE-------------------------------------------------------------------")
    output-print (word "--------------------------------------------------------------------------------------------------------------------------------------------------------")
    export-output (word "Output/Simulazione "random 10000 " con agenti " NumeroAgenti" Variazione Incentivi produzione "Varia_Tariffe_Incetivanti " Percentuale " %_Variazione_Tariffe" Incentivi_Installazione " Incentivi_Installazione".txt")
    
    ;;produco file utile per l'ottimizzatore
    ;;write_pl_file
    
    ;; scrivo su file i risultati relativi ai kW installati ogni anno con i diversi Conti Energia
    write_kW_CE_file
    ;; scrivo su file i risultati relativi al numero di impianti installati ogni anno con i diversi Conti Energia
    write_count_pf_CE_file
    
        
   ;;resetta alcune variabili per non avere probemi con simulazioni successive
   reset_var
    
    stop 
  ]
  if ( time = 2 );secondo semestre
  [
    set time 0
    set anno anno + 1
    aggiorna_prezzi;tutto cambia di anno in anno
    calcola_prezzi_minimi_gse
    calcola_prezzi_elettricita_consumatore
  ]
end

;; PROCEDURA PER RIPRISTINARE AL VALORE DI "DEFAULT" VARIABILI GLOBALI MODIFICABILI DA INTERFACCIA
to default
  ;; (for this model to work with NetLogo's new plotting features,
  ;; __clear-all-and-reset-ticks should be replaced with clear-all at
  ;; the beginning of your setup procedure and reset-ticks at the end
  ;; of the procedure.)
  __clear-all-and-reset-ticks
  ;; Costi prezzi energia al Kwh (dati del 2011) - vecchi valori croce
;  set costo_kwh_fascia1 0.278
;  set costo_kwh_fascia2 0.162
;  set costo_kwh_fascia3 0.194
;  set costo_kwh_fascia4 0.246
;  set costo_kwh_fascia5 0.276
  
  set Irradiazione_media_annua_kwh_kwp 1350 
  set Tecnologia_Pannello  "Monocristallini" 
  set Costo_Medio_kwP 3500
  set Tasso_lordo_rendimento_BOT 2.147
  set variazione_annuale_prezzi_elettricita 1.8 
  set prezzi_minimi_gsef1 0.103 
  set prezzi_minimi_gsef2 0.086
  set prezzi_minimi_gsef3 0.076
  set Riduzione_anno_%costo_pannello 3
  set Perdita_efficienza_annuale_pannello 0.5
  set kW2012 0
  set kW2013 0
  set kW2014 0
  set kW2015 0
  set kW2016 0
  set kW2007 0
  set kW2008 0
  set kW2009 0
  set kW2010 0
  set kW2011 0
  set kWTOT 0
  set kW_2CE 0
  set kW_3CE 0
  set kW_4CE 0
  set kW_5CE 0
  set INCENTIVO_INST2012 0
  set INCENTIVO_INST2013 0
  set INCENTIVO_INST2014 0
  set INCENTIVO_INST2015 0
  set INCENTIVO_INST2016 0 
  set INCENTIVO_INST2007 0
  set INCENTIVO_INST2008 0
  set INCENTIVO_INST2009 0
  set INCENTIVO_INST2010 0
  set INCENTIVO_INST2011 0 
  set INCENTIVO_INSTOT 0
  set INCENTIVO_PRO2012 0
  set INCENTIVO_PRO2013 0 
  set INCENTIVO_PRO2014  0 
  set INCENTIVO_PRO2015 0
  set INCENTIVO_PRO2016 0
  set INCENTIVO_PRO2007 0
  set INCENTIVO_PRO2008 0 
  set INCENTIVO_PRO2009  0 
  set INCENTIVO_PRO2010 0
  set INCENTIVO_PRO2011 0  
  set INCENTIVO_PROTOT 0
  set TOT_SPESA2012 0
  set TOT_SPESA2013 0
  set TOT_SPESA2014 0 
  set TOT_SPESA2015 0 
  set TOT_SPESA2016 0 
  set TOT_SPESA2007 0
  set TOT_SPESA2008 0
  set TOT_SPESA2009 0 
  set TOT_SPESA2010 0 
  set TOT_SPESA2011 0
  set TOT_SPESA 0
  set Budget2012 0
  set Budget2013 0
  set Budget2014 0
  set Budget2015 0
  set Budget2016 0
  set Budget2007 0
  set Budget2008 0
  set Budget2009 0
  set Budget2010 0
  set Budget2011 0
  set Budget2017 0
  set Incentivi_Installazione false
  set %_Incentivi_Installazione 10
  set Varia_Tariffe_Incetivanti false
  set %_Variazione_Tariffe 0
  set count_pf2012 0
  set  count_pf2013 0
  set count_pf2014 0
  set  count_pf2015 0
  set count_pf2016 0
  set count_pf2011 0
  set  count_pf2007 0
  set count_pf2008 0
  set  count_pf2009 0
  set count_pf2010 0
  set r2012 0
  set r2013 0
  set r2014 0
  set r2015 0
  set r2016 0
  set r2007 0
  set r2008 0
  set r2009 0
  set r2010 0
  set r2011 0
  set LeggiSerieStoriche true
  set fr "Nessuno"
  clear-output
end

;;SETUP DI VARIABILI CHE VENGONO MODIFICATE IN 'GO' MA DEVONO ESSERE RIPRISTINATE AI VALORI INIZIALI NEL CASO DI ESECUZIONI SUCCESSIVE
;; molto simile a default ma senza modificare la lettura da serie storica e random o il tipo di incentivo regionale
to reset_var
  ;; vecchi valori della tesi Croce - 2011
;  set costo_kwh_fascia1 0.278
;  set costo_kwh_fascia2 0.162
;  set costo_kwh_fascia3 0.194
;  set costo_kwh_fascia4 0.246
;  set costo_kwh_fascia5 0.276
  
  set percentuale_conoscenza_PV Diffusione_Conoscenza_Iniziale
  
  set Irradiazione_media_annua_kwh_kwp 1350 
  ;set Tecnologia_Pannello  "Monocristallini" 
  set Costo_Medio_kwP 3500 
  set Tasso_lordo_rendimento_BOT 2.147
  set variazione_annuale_prezzi_elettricita 1.8 
  set Riduzione_anno_%costo_pannello 3
  set Perdita_efficienza_annuale_pannello 0.5
end

;; SETUP A RUN TIME DI VARIABILI GLOBALI CHE NON VENGONO VARIANO DURANTE L'ESECUZIONE
to set_global
  set totneg2012 0
  set totneg2013 0
  set totneg2014 0
  set totneg2015 0
  set totneg2016 0
  set totneg2007 0
  set totneg2008 0
  set totneg2009 0
  set totneg2010 0
  set totneg2011 0
  set totnegsoldi 0
  set totdied 0
  set totreg 0
  set totnegroe 0
  set totneg_roe2007 0
  set totneg_roe2008 0
  set totneg_roe2009 0
  set totneg_roe2010 0
  set totneg_roe2011 0
  set totneg_roe2012 0
  set totneg_roe2013 0
  set totneg_roe2014 0
  set totneg_roe2015 0
  set totneg_roe2016 0
  set durata_impianti 20
  set count_tick 0
  set time 1;si parte dal primo semestre 2007
  set anno 2007
  set count_pf 0;non ho ancroa creato nuessuno
  set WACC Tasso_lordo_rendimento_BOT 
  set scala_dim_impianto 0.5
  
  set count_pf_2CE 0
  set count_pf_3CE 0
  set count_pf_4CE 0
  set count_pf_5CE 0
  
  set morti_FP_1 0
  set morti_FP_2 0
  set morti_FP_3 0
  set morti_FP_4 0
  set morti_FP_5 0
  set morti_FP_6 0
  
  set rand_FP1 0
  set rand_FP2 0
  set rand_FP3 0
  set rand_FP4 0
  set rand_FP5 0
  set rand_FP6 0
  
  set sum_roe_morti_2007 0
  set sum_roe_morti_2008 0
  set sum_roe_morti_2009 0
  set sum_roe_morti_2010 0
  set sum_roe_morti_2011 0
  set sum_roe_morti_2012 0
  set sum_roe_morti_2013 0
  set sum_roe_morti_2014 0
  set sum_roe_morti_2015 0
  set sum_roe_morti_2016 0
  
  set sum_roe_stimato_morti_2007 0
  set sum_roe_stimato_morti_2008 0
  set sum_roe_stimato_morti_2009 0
  set sum_roe_stimato_morti_2010 0
  set sum_roe_stimato_morti_2011 0
  set sum_roe_stimato_morti_2012 0
  set sum_roe_stimato_morti_2013 0
  set sum_roe_stimato_morti_2014 0
  set sum_roe_stimato_morti_2015 0
  set sum_roe_stimato_morti_2016 0
  
  set sum_roe_stimato_morti_CE_2 0
  set sum_roe_stimato_morti_CE_3 0
  set sum_roe_stimato_morti_CE_4 0
  set sum_roe_stimato_morti_CE_5 0
  
  set kW_1FP_2007 0
  set kW_1FP_2008 0
  set kW_1FP_2009 0
  set kW_1FP_2010 0
  set kW_1FP_2011 0
  set kW_1FP_2012 0
  set kW_1FP_2013 0
  set kW_2FP_2007 0
  set kW_2FP_2008 0
  set kW_2FP_2009 0
  set kW_2FP_2010 0
  set kW_2FP_2011 0
  set kW_2FP_2012 0
  set kW_2FP_2013 0
  set kW_3FP_2007 0
  set kW_3FP_2008 0
  set kW_3FP_2009 0
  set kW_3FP_2010 0
  set kW_3FP_2011 0
  set kW_3FP_2012 0
  set kW_3FP_2013 0
  set kW_4FP_2007 0
  set kW_4FP_2008 0
  set kW_4FP_2009 0
  set kW_4FP_2010 0
  set kW_4FP_2011 0
  set kW_4FP_2012 0
  set kW_4FP_2013 0
  set kW_5FP_2007 0
  set kW_5FP_2008 0
  set kW_5FP_2009 0
  set kW_5FP_2010 0
  set kW_5FP_2011 0
  set kW_5FP_2012 0
  set kW_5FP_2013 0
  set kW_6FP_2007 0
  set kW_6FP_2008 0
  set kW_6FP_2009 0
  set kW_6FP_2010 0
  set kW_6FP_2011 0
  set kW_6FP_2012 0
  set kW_6FP_2013 0
  
  set count_pf_1FP_2007 0
  set count_pf_1FP_2008 0
  set count_pf_1FP_2009 0
  set count_pf_1FP_2010 0
  set count_pf_1FP_2011 0
  set count_pf_1FP_2012 0
  set count_pf_1FP_2013 0
  set count_pf_2FP_2007 0
  set count_pf_2FP_2008 0
  set count_pf_2FP_2009 0
  set count_pf_2FP_2010 0
  set count_pf_2FP_2011 0
  set count_pf_2FP_2012 0
  set count_pf_2FP_2013 0
  set count_pf_3FP_2007 0
  set count_pf_3FP_2008 0
  set count_pf_3FP_2009 0
  set count_pf_3FP_2010 0
  set count_pf_3FP_2011 0
  set count_pf_3FP_2012 0
  set count_pf_3FP_2013 0
  set count_pf_4FP_2007 0
  set count_pf_4FP_2008 0
  set count_pf_4FP_2009 0
  set count_pf_4FP_2010 0
  set count_pf_4FP_2011 0
  set count_pf_4FP_2012 0
  set count_pf_4FP_2013 0
  set count_pf_5FP_2007 0
  set count_pf_5FP_2008 0
  set count_pf_5FP_2009 0
  set count_pf_5FP_2010 0
  set count_pf_5FP_2011 0
  set count_pf_5FP_2012 0
  set count_pf_5FP_2013 0
  set count_pf_6FP_2007 0
  set count_pf_6FP_2008 0
  set count_pf_6FP_2009 0
  set count_pf_6FP_2010 0
  set count_pf_6FP_2011 0
  set count_pf_6FP_2012 0
  set count_pf_6FP_2013 0
  
  set morti_conoscenza_2007 0
  set morti_conoscenza_2008 0
  set morti_conoscenza_2009 0
  set morti_conoscenza_2010 0
  set morti_conoscenza_2011 0
  set morti_conoscenza_2012 0
  set morti_conoscenza_2013 0
  set morti_conoscenza_2014 0
  set morti_conoscenza_2015 0
  set morti_conoscenza_2016 0
  
  set kw_sum 0
  set kw_installed_semester 0
  
  set roe_minimo ROE_minimo_desiderato
  
  set percentuale_conoscenza_PV Diffusione_Conoscenza_Iniziale
  set coeff_variazione_conoscenza_PV Coeff_Variazione_Diffusione
  
  set NAgentiFINAL NumeroAgenti;quanti crearne per semestre
  
  ifelse (Tecnologia_Pannello = "Monocristallini"  )
  [
    set m2Kwp  8;migliore tecnologia
  ]
  [
    ifelse ( Tecnologia_Pannello = "Policristallini" )
    [
      set m2Kwp 10
    ]
    [
      set m2Kwp 13
    ]
  ]  
  ;set Costo_Medio_kwP 3500
  
  ;genera_random  ;; genera impianti di tutte le dimensioni
  genera_random_impianti_piccoli  ;; genera esclusivamente impianti di dimensione minore - fascia 1,2 e 3
end

;; PROCEDURA CHE SI SOSTITUISCE ALLA LETTURA DA SERIE STORICHE E GENERA NUMERI PSEUDO CASUALI  DA ATTIBUIRE AGLI AGENTI E LI INSERISCE IN APPOSITE LISTE
to genera_random
  let c 0
  set random_ostinazione [];liste vuote
  set random_m2 []
  set random_bgt []
  set random_consumo []
  ;; while [ c <  ( NAgentiFINAL ) ];riempio le liste   ---> problema: inserisce solo NAgenti valori random, utilizzati in tutti i semestri!
  while [ c < ( NAgentiFINAL * 2 * (2013 - 2007 + 1) ) ] ;; inserisco tanti valori random quanti sono i semestri, così ogni singolo agente disporrà di valori differenti
  [
    set c c + 1 
    
    ;; vecchi valori (tesi Croce) - ne ho messi altri che mi sembravano più sensati
    ;; set number 1 + random 100  
    ;; set random_ostinazione lput  number random_ostinazione ;lista ostinazione
    ;; set number 1 + random-float 9   
    ;; set random_m2 lput number random_m2;lista metri quadri
    ;; set number 1 + random-float 9   
    ;; set random_bgt lput number random_bgt;lista budget
    ;; set number 1 + random-float 9  
    ;; set random_consumo lput number random_consumo;lista consumo 
    
    
    ;; random ostinazione
    set number round random-normal 75 20
    if (number < 1 ) [set number 1 ]   
    if (number > 100 ) [set number 100 ]   
    set random_ostinazione lput  number random_ostinazione 
    
    
    ;;per simulare come effettivamente gli impianti PV installati nel 2007-2013 siano distribuiti per classe di potenza, mi avvalgo dei dati forniti dal GSE sulla distribuzione reale
    ;; 32.37% Fascia 1, 56.39% Fascia 2, 8.93% Fascia 3, 2.11% Fascia 4, 0.17% Fascia 5, 0.03% Fascia 6
    ;; è necessario inserire anche valori adeguati per il budget disponibile, poiché con i vecchi valori (in genere minori di qualche centinaia di migliaia di euro) non è possibile 
    ;; realizzare impianti di dimensioni maggiori (fascie 4,5,6) --> con stime del 2011 il prezzo degli impianti 'chiavi in mano' è: 9000euro per impianti da 3kW, 400,000euro per impianti
    ;; da 200kW e 1,700,000euro per 1MW - questi valori servono solo per stimare i budget di cui gli agenti interessati a grandi impianti devono essere dotati
    set number random 10000
    let rndm_m2 0
    ;; ricordiamo che in genera_pf il budget letto dalle liste casuali è comunque moltiplicato di un fattore compreso tra 10k-200k
    let rndm_budget 0
    set rndm_budget 1 + random-float 9
    
    ;; con i valori medi utilizzati dal modello originale per il consumo annuo (usato per calcolare la dimensione dell'impianto desiderato) gli impianti di fascia 1 non sono mai considerati
    ;; economici, anche dopo il ridimensionamento - probabilmente nella realtà chi li costruisce non si aspetta di coprire interamente il suo fabbbisogno con tali impianti
    ;; pre riflettere la situazione reale, in cui molti impianti di fascia 1 sono installati, il valore casuale del consumo viene opportunamente diminuito per tali impianti
    let rndm_consumo 0
    set rndm_consumo 1 + random-float 9
    ifelse (number < 5639)[ ;; fascia 2 3kW<P<=20kW -->   3kW*m2KWp<m2<=20kW
      ;;set rndm_m2 (3 * m2Kwp) + random-float (20 * m2Kwp)
      set rndm_m2 (3 * m2Kwp) + random-float (15 * m2Kwp)
      set rndm_consumo rndm_consumo * 0.4
      
      set rand_FP2 rand_FP2 + 1
    ][
    ifelse (number < (5639 + 3237) and number > 5639)[ ;; fascia 1 1kW<P<=3kW
      ;; set rndm_m2 (1 * m2Kwp) + random-float (3 * m2Kwp)
       set rndm_m2  m2Kwp + random-float (2 * m2Kwp)
      
      set rndm_consumo rndm_consumo * 0.08 ;; 0.1 è un parametro trovato per tentativi
      
      set rand_FP1 rand_FP1 + 1
      ;; output-print  (word   "*Genera random fascia 1: m2 " rndm_m2) 
    ][
    ifelse (number < (5639 + 3237 + 893) and number > (5639 + 3237) )[ ;; fascia 3 20kW<P<=200kW
      set rndm_m2 (20 * m2Kwp) + random-float (180 * m2Kwp)
      set rndm_consumo rndm_consumo * 0.7
      
      set rand_FP3 rand_FP3 + 1
    ][
    ifelse (number < (5639 + 3237 + 893 + 211) and number > (5639 + 3237 + 893) )[ ;; fascia 4 200kW<P<=1000kW
      set rndm_m2 (200 * m2Kwp) + random-float (800 * m2Kwp)
      set rndm_budget rndm_budget * 15
      
      set rand_FP4 rand_FP4 + 1
    ][
    ifelse (number < (5639 + 3237 + 893 + 211 + 17) and number > (5639 + 3237 + 893 + 211) )[ ;; fascia 5 1000kW<P<=5000kW
      set rndm_m2 (1000 * m2Kwp) + random-float (4000 * m2Kwp)
      set rndm_budget rndm_budget * 100
      
      set rand_FP5 rand_FP5 + 1
    ][
    ifelse (number < (5639 + 3237 + 893 + 211 + 17 + 3) and number > (5639 + 3237 + 893 + 211 + 17) )[ ;; fascia 6 P>5000kW
      set rndm_m2 (5000 * m2Kwp) + random-float (50000 * m2Kwp) ;; supponiamo per ora un limite massimo anche per gli impianti di fascia 6, cioè 50000kW
      set rndm_budget rndm_budget * 500
      
      set rand_FP6 rand_FP6 + 1
    ][
      ;; default case  --> non dovremmo mai fnire qui, se ciò dovesse accadere creiamo comunque un impianto di fascia 2
      set rndm_m2 (3 * m2Kwp) + random-float (15 * m2Kwp)
      set rndm_consumo rndm_consumo * 0.4
      set rand_FP2 rand_FP2 + 1
    ]]]]]]
    
    set random_m2 lput rndm_m2 random_m2
    set random_bgt lput rndm_budget random_bgt
    set random_consumo lput rndm_consumo random_consumo
    
    ;; per controllare generazione di lista valori random
    file-open "/media/sda4/ePolicy/simulationModel/output/random_list.pl"
    ;file-print (word "rndm_value("rndm_m2",   ----   " rndm_budget ",   ----  "rndm_consumo ")")
    file-close
    
  ]
end

;; procedura che genera valori random per definire gli agenti: a differenza di genera_random, questa crea esclusivamente impianti di piccola taglia - fasce di potenza 1,2,3 - per 
;; poter simulare meglio l'istallazione di pannelli PV da parte di privati cittadini, senza preender in considerazione grandi impianti (probabilmente frutto di decisioni politiche)
to genera_random_impianti_piccoli
 let c 0
  set random_ostinazione [];liste vuote
  set random_m2 []
  set random_bgt []
  set random_consumo []
  
  while [ c < ( NAgentiFINAL * 2 * (2013 - 2007 + 1) ) ] ;; inserisco tanti valori random quanti sono i semestri, così ogni singolo agente disporrà di valori differenti
  [
    set c c + 1 
    
    ;; random ostinazione
    set number round random-normal 75 20
    if (number < 1 ) [set number 1 ]   
    if (number > 100 ) [set number 100 ]   
    set random_ostinazione lput  number random_ostinazione 
    
    ;; per la probabilità che un agente appartenga ad una determinata classe-> simile al metodo di genera_random ma senza le classi di potenza 4,5,6
    set number random 100
    let rndm_m2 0
    ;; ricordiamo che in genera_pf il budget letto dalle liste casuali è comunque moltiplicato di un fattore compreso tra 10k-200k
    let rndm_budget 0
    set rndm_budget 1 + random-float 9
    
    ;; con i valori medi utilizzati dal modello originale per il consumo annuo (usato per calcolare la dimensione dell'impianto desiderato) gli impianti di fascia 1 non sono mai considerati
    ;; economici, anche dopo il ridimensionamento - probabilmente nella realtà chi li costruisce non si aspetta di coprire interamente il suo fabbbisogno con tali impianti
    ;; pre riflettere la situazione reale, in cui molti impianti di fascia 1 sono installati, il valore casuale del consumo viene opportunamente diminuito per tali impianti
    let rndm_consumo 0
    set rndm_consumo 1 + random-float 9
    
    ifelse (number < 58)[ ;; fascia 2 3kW<P<=20kW -->   3kW*m2KWp<m2<=20kW
      ;;set rndm_m2 (3 * m2Kwp) + random-float (20 * m2Kwp)
      set rndm_m2 (3 * m2Kwp) + random-float (15 * m2Kwp)
      set rndm_consumo rndm_consumo * 0.4
      
      set rand_FP2 rand_FP2 + 1
    ][
    ifelse (number < (58 + 35) and number > 58)[ ;; fascia 1 1kW<P<=3kW
      ;; set rndm_m2 (1 * m2Kwp) + random-float (3 * m2Kwp)
      set rndm_m2  m2Kwp + random-float (2 * m2Kwp)
      
      set rndm_consumo rndm_consumo * 0.08 ;; 0.1 è un parametro trovato per tentativi
      
      set rand_FP1 rand_FP1 + 1
      ;; output-print  (word   "*Genera random fascia 1: m2 " rndm_m2) 
    ][
     ;; default case  --> fascia 3 20kW<P<=200kW
     set rndm_m2 (20 * m2Kwp) + random-float (100 * m2Kwp) ;; diverso dai valori di genera_random perché voglio considerare impianti di fascia 3 non troppo grandi
     set rndm_consumo rndm_consumo * 0.7
      
     set rand_FP3 rand_FP3 + 1
    ]]
    
    set random_m2 lput rndm_m2 random_m2
    set random_bgt lput rndm_budget random_bgt
    set random_consumo lput rndm_consumo random_consumo
    
  ]
end

;; PROCEDURA CHE "SETTA" IL GRAFICO PBT
to setup_plot_PBT
  set-current-plot "Pay Back Time"
  set-current-plot-pen "axis"
  auto-plot-off
  plotxy 0 0
  plotxy 1000000000 0
  auto-plot-on  
  set-plot-x-range 0 durata_impianti
end

;; CREAZIONE, COLLOCAMENTO NELL'AMBIENTE VIRTUALE, RICHIAMO PROCEDURA GENERAZIONE AGENTI E VALUTA FATTIBILITA' 
to create_pf
  set-default-shape pf "house";forma di una casa
  ask n-of NAgentiFINAL patches;genera NAgentiFINAL pf
    [
      sprout-pf 1 ;ne genero uno
      [ ;stabilisce le variabili iniziali per ogni agente e invoca lo studio di fattibilità
        
         ;; stima del roe
        set roe_stimato 0 ; per inizializzarlo
        set flag_roe false 
        set flag_sum_roe_morti false
        set flag_sum_roe_stimato_morti false
        
        set influenza 0
        elimina_sovrapposizioni;im modo che le case non siano una sopra laltra
        set count_pf count_pf + 1;contatore investitori
        set id who; chi sono? sono io.
        genera_pf;legge da file o da lista le variabili dell'agente
        set valutaincentivi true
        
        ;;output-print  (word   "DEBUG PRIMA DELLA VALUTAZIONE FATTIBILITÀ") 
        ;;output-print  (word   "------------>>> AGENTE " id  " M2 Disponibili " M2Disposizione " Budget " budget " Consumo Annuale " consumo_medio_annuale) 
        
        ;; la valuatazione della fattibilità dell'impianto avviense solamente se l'agente è a conoscenza delle possibilità offerte dal PV --> in particolare ogni agente genera
        ;; un numero casuale e lo confronta con il valore della percentuale di conoscenza
        let prob_conoscenza random 101
        ifelse ( prob_conoscenza <= percentuale_conoscenza_PV ) ;; l'agente è a conoscenza
        [
          ;; valutazione fattibilità impianto versione iniziale (Croce+Cerri)
          valuta_fattibilita_impianto;se farà l'impianto con gli incentivi regionali o no??
          if morto = true;se la valutazione con gli incentivi non mi conviene provo senza incentivi
          [         
            ripristina
            set valutaincentivi false
            valuta_fattibilita_impianto;valuto di fare l'inpianto senza considerare gli incentivi 
          ]
        ]
        [ ;; l'agente non è a conoscenza
          muori_mancanza_conoscenza
        ]
        ;stima_roe
        ;; output-print  (word   "------------>>> AGENTE " id  "  Roe stimato per l'investimento: " roe_stimato) 
        ;; output-print  (word   "----DEBUG------------>>> AGENTE " id  "  stima_flusso_cassa_cumulato: " stima_flusso_cassa_cumulato) 
        ;; output-print  (word   "----DEBUG------------>>> AGENTE " id  "  costo_impianto: " costo_impianto) 
        ;; output-print  (word   "----DEBUG------------>>> AGENTE " id  "  ifin: " ifin) 
        ;; output-print  (word   "----DEBUG------------>>> AGENTE " id  "  intRegione: " intRegione) 
        ;; output-print  (word   "----DEBUG------------>>> AGENTE " id  "  importo_prestito: " importo_prestito) 
        ;; output-print  (word   "----DEBUG------------>>> AGENTE " id  "  durata_impianti: " durata_impianti) 
      ]    
    ] 
end

;ripristino stato precedente
to ripristina
  set rataReg 0
  set rataBanca 0
  set iregg 0
  set intRegione 0
  set freg false         
  set ifin 0
  set ratepagate 0
  set fallito false 
  set %ostinazione initosti
end

;; PROCEDURA CHE GENERA IL SET DI AGENTI: RICORDIAMO IL PRIMO AGENTE DI OGNI SET ASSUME I VALORI INDICATI TRAMITE INTERFACCIA GLI ALTRI AGENTI PRELEVANO I DATI 
;; O DAL FILE "SerieStoriche.txt" OPPURE PRELEVANDOLI DALLE LISTE E CALCOLA LE DIMENSIONI E I COSTI DELL'IMPIANTO
to genera_pf
  set mortoxm2 false
  set morto false
  set prestito false;al momento
  set ridimensionamento false 
  set incentivo_installazione 0
  ifelse (id = 0 or id = (NAgentiFINAL * count_tick ) );per tutti gli agenti zero, uno ogni semestre  
    ;;GENERAZIONE AGENTE ZERO
    [
      set %ostinazione  100;;parte da ostinazione massima
      set consumo_medio_annuale  Consumo_medio_annuale_KWh
      set budget Budget_Medio_MiliaiaEuro * 1000
      set M2disposizione M2_Disposizione
      set %cop_cosumi Media%_copertura_consumi_richiesta
    ]
    [
      ;;PROCEDURA LETTURA DA FILE
      ;legge:  ostinazione    consumo_medio_annuale   budget    M2disposizione
      ifelse ( LeggiSerieStoriche and file-exists? "SerieStoriche.txt" )
      [     
        let finish false
        let count_t 0
        file-open "SerieStoriche.txt"
        while [ not file-at-end? and not finish]
        [      
          let letto file-read
          set count_t count_t + 1
          if (count_t = ((id * 4) + 1) );+1 perchè parte da 1
          [
            set  %ostinazione  letto
            set letto file-read
            set consumo_medio_annuale letto
            set letto file-read
            set budget letto
            set letto file-read
            set M2disposizione letto        
            set %cop_cosumi  Media%_copertura_consumi_richiesta
            set finish true;
          ]
        ]
        file-close
      ]
      [;else random, li prendo dalle liste
       ;;PROCEDURA SERIE CASUALI PRELEVANDO DA LISTE
        set %ostinazione item  (id - ( NAgentiFINAL * count_tick ) - 1 ) random_ostinazione 
        ;; vecchia versione, con approssimazione a intero
        ;; set consumo_medio_annuale round  (item  (id - ( NAgentiFINAL * count_tick ) - 1 ) random_consumo ) * Consumo_medio_annuale_KWh
        set consumo_medio_annuale (item  (id - ( NAgentiFINAL * count_tick ) - 1 ) random_consumo ) * Consumo_medio_annuale_KWh
        set budget round (item  (id - ( NAgentiFINAL * count_tick ) - 1 ) random_bgt )  * Budget_Medio_MiliaiaEuro * 1000
        ;; vecchia versione per stabilire i m2 a disposizione, in cui occoreva anche moltiplicare per il parametro impostato da interfaccia
        ;;set M2disposizione round (item  (id - ( NAgentiFINAL * count_tick ) - 1 ) random_m2 )  * M2_Disposizione
        ;; nuova versione: il valore di m2 è un valore casuale già correttamente impostato
        set M2disposizione round (item  (id - ( NAgentiFINAL * count_tick ) - 1 ) random_m2 )
        set %cop_cosumi  Media%_copertura_consumi_richiesta
        
        
      ]
    ]
    
  set_conto_energia
  calcola_dimensione;dopo ho dimensione impianto i m2
  calcola_costi_impianto;dopo ho costo impianto in euro
  ;gestione incentivi regionali                          
  set initosti %ostinazione
  set rataReg 0
  set rataBanca 0
  set iregg 0
  set intRegione 0
  set freg false         
  set ifin 0
  set ratepagate 0
  set fallito false 
  let p random 101;vorrà essere finanziato??
  if p < ProbFinanz;mi faccio finanziare
    [       
      ifelse fr = "Asta";la regione paga una percentuale a chi la chiede finchè ha dei soldi
        [                     
          ;calcolo percentuale
          set pfin PercMin + random (PercMax - PercMin + 1);percentuale richiesta da 10 a 50
          set ifin (costo_impianto * pfin) / 100;quanto risparmio
          ifelse BudgetCorrente - ifin > 0
          [
            set BudgetCorrente BudgetCorrente - ifin;aggiorno budget
            set totreg totreg + 1
            set freg true
          ]
          [
          set ifin 0  
          ]
        ]
        [
          let ra random 101;per vedere se la banca accetta
          ifelse fr = "Conto interessi" and ra < Accettato;la regione paga gli interessi dei mutui, l'agente paga la stessa cifra, ma a rate
          [            
            set %ostinazione %ostinazione +  InfluenzaRate ;se pago a rate sono più interessato
            set iregg (costo_impianto * InterBanca / 100 );quanto sborsa la regione
            ifelse BudgetCorrente - iregg > 0
            [
              set BudgetCorrente BudgetCorrente - iregg
              ;if BudgetCorrente < 0 [set BudgetCorrente 0]  
              set totreg totreg + 1
              set freg true
            ]
            [
              set iregg 0 
              set %ostinazione initosti
            ]
          ]
          [ 
            ifelse fr ="Rotazione";il mututo lo fa la regione, ma con tassi di interesse più leggeri.
            [             
              
              set %ostinazione %ostinazione +  InfluenzaRate ;se pago a rate sono più interessato              
              set intRegione (costo_impianto * InterRegione / 100  );quanto pago di interessi alla regione  
              ifelse BudgetCorrente - costo_impianto > 0 
              [            
                set BudgetCorrente BudgetCorrente - costo_impianto;la regione presta i soldi per l'impianto
                ;if BudgetCorrente < 0 [set BudgetCorrente 0]  
                calcola_rata_regione;calcola rateReg->quanto versare ogni anno
                set freg true
                set totreg totreg + 1
              ]
              [
                set intRegione 0
                set %ostinazione initosti                
              ]
            ]
            [ 
              if fr = "Garanzia";la regione da la garanzia alle banche sugli agenti, sicchè la banca non esclude dal mutuo nessun agente
              [                
                set %ostinazione %ostinazione +  InfluenzaRate;se pago a rate sono più interessato                
                set ifin (costo_impianto * InterBanca / 100 )*( -1);quanto pago di interessi alla banca
                calcola_rata_banca
                ifelse BudgetCorrente - costo_impianto - guadagnobanca > 0
                [
                  let rra random 101
                  if rra < FallimentoMutuo;con una certa probabilità fallisco
                  [
                    set fallito true
                    set BudgetCorrente BudgetCorrente - costo_impianto - guadagnobanca;
                    set totdied  totdied + 1            
                    die                 
                  ] 
                  set freg true
                  set totreg totreg + 1 
                ]
                [
                  set ifin 0
                  set %ostinazione initosti
                  set rataBanca 0
                  set guadagnobanca 0
                ]
              ]              
            ]            
          ]          
        ]
    ]        
  set ricavi_vendita []
  set ricavi_autoconsumo []
  set ricavi_incentivi []
  set costi_energia_prelevata []
  set flusso_cassa []
  set flusso_cassa_attualizzato []
  set van []
  set PBT  "non rilevato"
  ;calcolo interfernza
  set influenza (count pf in-radius raggio) - 1
  ;set label influenza ;se si vuole visualizzare il numero di vicin1
  if intorno [ask patches in-radius raggio[set pcolor 89]]  
end

;; PROCEDURA CHE CALCOLA LE DIMENSIONI DELL'IMPIANTO A PARTIRE DAI DATI AGENTE
to calcola_dimensione
  ;; calcolo della potenza dell ' impianto : CONSUMO_MEDIO_ANNUALE *  %Obbiettivo copertura consumi energetici 
  set kw_annui_impianto round ((consumo_medio_annuale *  %cop_cosumi) / 100 );formuline note
  ;; calcolo dimensione M2 impianto
  set dimensione_impianto (round  (kw_annui_impianto / Irradiazione_media_annua_kwh_kwp) * m2kwp )
end

;; PROCEDURA VALUTAZIONE FATTIBILITA' INVESTIMENTO (V. FLOW CHART)
to valuta_fattibilita_impianto
  calcola_fascia_potenza
  
  ;;output-print  (word   "************** AGENTE " id  " dim_im: " dimensione_impianto " m2 disposizione: " M2disposizione " costo im: " costo_impianto " budget " budget) 
  ifelse (dimensione_impianto <=  M2disposizione ) and (costo_impianto - ifin + intRegione <=  budget );tutto perfetto
    [
      set color green
      aumenta_impianto;guardo se riesco ad aumentare la dim dell'mipianto
      calcola_fascia_potenza
      
      ;; calcola_tariffa_gse  ;;Vecchia versione senza CE
      ;; calcola_prezzi_minimi_gse
      calcola_tariffe_ce
      
      stima_roe
      ;; decisione presa anche sulla base del roe stimato: se è minore di quello minimo l'agente non realizza l'impianto
      ifelse (roe_stimato > roe_minimo)[ ;; impianto realizzabile 
          aggiorna_kW
          aggiorna_incentivi_installazione
          aggiorna_budget_annuale
          aggiorna_pf
          stampa
      ]
      [  ;; impianto non realizzato
        output-print   ("*************************************************************************************************")
        output-print  (word   "************** AGENTE " id  "realizzazione impianto impossibile : ROE insufficiente") 
        output-print  (word   "DIE")
        output-print   ("*************************************************************************************************")
        set flag_roe true
        set flag_sum_roe_morti true
        set flag_sum_roe_stimato_morti true
        muori
      ]
      
    ]
    [
      ifelse (dimensione_impianto >  M2disposizione ) and (costo_impianto - ifin + intRegione >  budget );muoio
        [
          ;; voglio stimare il roe anche nel caso in cui il pf non venga realizzato, per stabilire quale sia il metodo migliore per valutare la fattibilità del'impianto
          calcola_fascia_potenza
          calcola_tariffe_ce
          stima_roe
          
          ifelse valutaincentivi = false
          [
            output-print   ("*************************************************************************************************")
            output-print  (word   "************** AGENTE " id  "realizzazione impianto impossibile : Eccedenza dimensionamento e costi") 
            output-print  (word   "DIE")
            output-print   ("*************************************************************************************************")
            set count_pf count_pf - 1
            ;show "realizzazione impianto impossibile : Eccedenza dimensionamento e costi"
            ;show word costo_impianto word "   " word (costo_impianto - ifin + intRegione) word "    "  word budget word "  " morto
            if mortoxm2 = false;se con gli incentivi è morto per questioni di dimensioni, non è corretto mettere l'agente tra chi non fa l'investimento per 
            [;motivi economici
              set  totnegsoldi totnegsoldi + 1
              ;show "realizzazione impianto impossibile : Eccedenza dimensionamento e costi"
              ;show word costo_impianto word "   " word (costo_impianto - ifin + intRegione) word "    "  word budget word "  " morto
              ifelse anno = 2007 [ set totneg2007 totneg2007 + 1 ][
              ifelse anno = 2008 [ set totneg2008 totneg2008 + 1 ][
              ifelse anno = 2009 [ set totneg2009 totneg2009 + 1 ][
              ifelse anno = 2010 [ set totneg2010 totneg2010 + 1 ][
              ifelse anno = 2011 [ set totneg2011 totneg2011 + 1 ][
              ifelse anno = 2012 [ set totneg2012 totneg2012 + 1 ][
              ifelse anno = 2013 [ set totneg2013 totneg2013 + 1 ][
              ifelse anno = 2014 [ set totneg2014 totneg2014 + 1 ][
              ifelse anno = 2015 [ set totneg2015 totneg2015 + 1 ][
              ifelse anno = 2016 [ set totneg2016 totneg2016 + 1 ][
               ;; default case 
              ]]]]]]]]]]
                  
            ]   
          ]  
          [
            ;show "realizzazione impianto impossibile : Eccedenza dimensionamento e costi"
            ;show word costo_impianto word "   " word (costo_impianto - ifin + intRegione) word "    " word budget word "  "morto
          ]    
          muori
        ]
        [          
          ifelse ( dimensione_impianto >  M2disposizione ) 
          [ accetta_ridimensionamento  ];ci sto coi soldi  ma non con l'impianto
          [ accetta_prestito ];ci sto con le dimensioni, ma non coi soldi
        ]
    ]
end

;se muore annulla il prestito dalla regione
to muori
  if freg = true and valutaincentivi = true
    [     
      ifelse fr = "Asta"
        [
          set BudgetCorrente BudgetCorrente + ifin;ripristino situazione precedente
        ]
        [
          ifelse fr = "Conto interessi"
            [
              set BudgetCorrente BudgetCorrente + iregg
            ]     
            [
              ifelse fr = "Rotazione"
                [
                  set BudgetCorrente BudgetCorrente + costo_impianto  
                ]
                [
                  if fr ="Garanzia" and fallito
                  [
                    set BudgetCorrente BudgetCorrente + costo_impianto + guadagnobanca;
                  ]
                ]
            ]         
        ]            
    ]  
  ifelse valutaincentivi = false
  [
    if flag_roe = true [ aggiorna_statistiche_roe_insufficiente ]
    if flag_sum_roe_morti = true [ aggiorna_sum_roe_morti ]
    if flag_sum_roe_stimato_morti = true [ aggiorna_sum_roe_stimato_morti ]
    
    set totdied  totdied + 1  
    ifelse fascia_potenza = 1 [ set morti_FP_1 morti_FP_1 + 1 ][
    ifelse fascia_potenza = 2 [ set morti_FP_2 morti_FP_2 + 1 ][
    ifelse fascia_potenza = 3 [ set morti_FP_3 morti_FP_3 + 1 ][
    ifelse fascia_potenza = 4 [ set morti_FP_4 morti_FP_4 + 1 ][
    ifelse fascia_potenza = 5 [ set morti_FP_5 morti_FP_5 + 1 ][
    ifelse fascia_potenza = 6 [ set morti_FP_6 morti_FP_6 + 1 ][
      ;; default case
    ]]]]]]
    die
  ]
  [
    set morto true
    if freg = true
    [set totreg totreg - 1]
  ]   
end


;; gli agenti possono terminare anche nel caso non siano a conoscenza delle possibilità offerte dal PV
to muori_mancanza_conoscenza
  output-print         ("*************************************************************************************************")
  output-print  (word   "************** AGENTE " id  "Morte causa diffusione conoscenza**************") 
  output-print  (word   "DIE")
  set count_pf count_pf - 1
        
  ifelse anno = 2007 [ set totneg2007 totneg2007 + 1  set morti_conoscenza_2007 morti_conoscenza_2007 + 1 ][
  ifelse anno = 2008 [ set totneg2008 totneg2008 + 1  set morti_conoscenza_2008 morti_conoscenza_2008 + 1 ][
  ifelse anno = 2009 [ set totneg2009 totneg2009 + 1  set morti_conoscenza_2009 morti_conoscenza_2009 + 1 ][
  ifelse anno = 2010 [ set totneg2010 totneg2010 + 1  set morti_conoscenza_2010 morti_conoscenza_2010 + 1 ][
  ifelse anno = 2011 [ set totneg2011 totneg2011 + 1  set morti_conoscenza_2011 morti_conoscenza_2011 + 1 ][
  ifelse anno = 2012 [ set totneg2012 totneg2012 + 1  set morti_conoscenza_2012 morti_conoscenza_2012 + 1 ][
  ifelse anno = 2013 [ set totneg2013 totneg2013 + 1  set morti_conoscenza_2013 morti_conoscenza_2013 + 1 ][
  ifelse anno = 2014 [ set totneg2014 totneg2014 + 1  set morti_conoscenza_2014 morti_conoscenza_2014 + 1 ][
  ifelse anno = 2015 [ set totneg2015 totneg2015 + 1  set morti_conoscenza_2015 morti_conoscenza_2015 + 1 ][
  ifelse anno = 2016 [ set totneg2016 totneg2016 + 1  set morti_conoscenza_2016 morti_conoscenza_2016 + 1 ][
        ;; default case 
  ]]]]]]]]]]
  
  die
end

;; raccolta di statistiche per gli impianti che non vengono realizzati a causa del roe insufficiente
to aggiorna_statistiche_roe_insufficiente
  set  totnegroe totnegroe + 1
  ifelse anno = 2007 [ set totneg_roe2007 totneg_roe2007 + 1 ][
  ifelse anno = 2008 [ set totneg_roe2008 totneg_roe2008 + 1 ][
  ifelse anno = 2009 [ set totneg_roe2009 totneg_roe2009 + 1 ][
  ifelse anno = 2010 [ set totneg_roe2010 totneg_roe2010 + 1 ][
  ifelse anno = 2011 [ set totneg_roe2011 totneg_roe2011 + 1 ][
  ifelse anno = 2012 [ set totneg_roe2012 totneg_roe2012 + 1 ][
  ifelse anno = 2013 [ set totneg_roe2013 totneg_roe2013 + 1 ][
  ifelse anno = 2014 [ set totneg_roe2014 totneg_roe2014 + 1 ][
  ifelse anno = 2015 [ set totneg_roe2015 totneg_roe2015 + 1 ][
  ifelse anno = 2016 [ set totneg_roe2016 totneg_roe2016 + 1 ][
    ;; default case 
  ]]]]]]]]]]
end

;; tiene traccia del roe degli agenti che sono morti durante l'esecuzione, per poter calcolare correttamente il roe medio finale
to aggiorna_sum_roe_morti
  ifelse anno = 2007 [ set sum_roe_morti_2007 sum_roe_morti_2007 + roe% ][
  ifelse anno = 2008 [ set sum_roe_morti_2008 sum_roe_morti_2008 + roe% ][
  ifelse anno = 2009 [ set sum_roe_morti_2009 sum_roe_morti_2009 + roe% ][
  ifelse anno = 2010 [ set sum_roe_morti_2010 sum_roe_morti_2010 + roe% ][
  ifelse anno = 2011 [ set sum_roe_morti_2011 sum_roe_morti_2011 + roe% ][
  ifelse anno = 2012 [ set sum_roe_morti_2012 sum_roe_morti_2012 + roe% ][
  ifelse anno = 2013 [ set sum_roe_morti_2013 sum_roe_morti_2013 + roe% ][
  ifelse anno = 2014 [ set sum_roe_morti_2014 sum_roe_morti_2014 + roe% ][
  ifelse anno = 2015 [ set sum_roe_morti_2015 sum_roe_morti_2015 + roe% ][
  ifelse anno = 2016 [ set sum_roe_morti_2016 sum_roe_morti_2016 + roe% ][
  ]]]]]]]]]]
end

;; tiene traccia del roe stimato degli agenti che sono morti durante l'esecuzione, per poter calcolare correttamente il roe stimato medio finale
to aggiorna_sum_roe_stimato_morti
  ifelse anno = 2007 [ set sum_roe_stimato_morti_2007 sum_roe_stimato_morti_2007 + roe_stimato ][
  ifelse anno = 2008 [ set sum_roe_stimato_morti_2008 sum_roe_stimato_morti_2008 + roe_stimato ][
  ifelse anno = 2009 [ set sum_roe_stimato_morti_2009 sum_roe_stimato_morti_2009 + roe_stimato ][
  ifelse anno = 2010 [ set sum_roe_stimato_morti_2010 sum_roe_stimato_morti_2010 + roe_stimato ][
  ifelse anno = 2011 [ set sum_roe_stimato_morti_2011 sum_roe_stimato_morti_2011 + roe_stimato ][
  ifelse anno = 2012 [ set sum_roe_stimato_morti_2012 sum_roe_stimato_morti_2012 + roe_stimato ][
  ifelse anno = 2013 [ set sum_roe_stimato_morti_2013 sum_roe_stimato_morti_2013 + roe_stimato ][
  ifelse anno = 2014 [ set sum_roe_stimato_morti_2014 sum_roe_stimato_morti_2014 + roe_stimato ][
  ifelse anno = 2015 [ set sum_roe_stimato_morti_2015 sum_roe_stimato_morti_2015 + roe_stimato ][
  ifelse anno = 2016 [ set sum_roe_stimato_morti_2016 sum_roe_stimato_morti_2016 + roe_stimato ][
  ]]]]]]]]]]
  
  ifelse conto_energia = 2 [ set sum_roe_stimato_morti_CE_2 sum_roe_stimato_morti_CE_2 + roe_stimato ][
  ifelse conto_energia = 3 [ set sum_roe_stimato_morti_CE_3 sum_roe_stimato_morti_CE_3 + roe_stimato ][
  ifelse conto_energia = 4 [ set sum_roe_stimato_morti_CE_4 sum_roe_stimato_morti_CE_4 + roe_stimato ][
  ifelse conto_energia = 5 [ set sum_roe_stimato_morti_CE_5 sum_roe_stimato_morti_CE_5 + roe_stimato ][
  ]]]]
  
end

;; VALUTAZIONE AUMENTO DIMENSIONI E POTENZA IMPIANTO IN BASE A OSTINAZIONE
to aumenta_impianto
  let dim_imp dimensione_impianto
  if ( %ostinazione + influenza * sensibilita > 50);se non sono ostinato nemmeno cerco di aumentare le dimensioni
  [
    set dimensione_impianto M2disposizione
    set kw_annui_impianto (round ( dimensione_impianto / m2Kwp )) * Irradiazione_media_annua_kwh_kwp
    calcola_costi_impianto
    if (costo_impianto - ifin + intRegione >= budget);se dopo l'aumento di dimensione non ci sto coi soldi
    [
      set dimensione_impianto dim_imp 
      set kw_annui_impianto (round ( dimensione_impianto / m2Kwp )) * Irradiazione_media_annua_kwh_kwp
      calcola_costi_impianto;rimetto come prima
    ]
  ]  
end

;; VALUTAZIONE RIDIMENSIONAMENTO POTENZA E DIMENSIONE IMPIANTO
to accetta_ridimensionamento
  let dimensione_eccedenza dimensione_impianto - M2disposizione
  ;; output-print  (word   " Ridimensionamento ************** AGENTE " id  " dim_im: " dimensione_impianto " m2 disposizione: " M2disposizione " costo im: " costo_impianto " budget " budget "dim_ecc; " dimensione_eccedenza ) 
  ifelse (dimensione_eccedenza <= round ( ( M2disposizione * ( %ostinazione + influenza * sensibilita )) / 100 ) )
    [
      ;;set size dimensione_impianto / scala_dim_impianto
      set color blue
      set ridimensionamento true
      set dimensione_impianto  M2disposizione 
      set kw_annui_impianto (round ( dimensione_impianto / m2Kwp )) * Irradiazione_media_annua_kwh_kwp
      calcola_costi_impianto
      calcola_fascia_potenza
      calcola_tariffe_ce
      ;; calcola_tariffa_gse vecchia versione senza CE
      stima_roe
      ;; decisione presa anche sulla base del roe stimato: se è minore di quello minimo l'agente non realizza l'impianto
      ifelse (roe_stimato > roe_minimo)[ ;; impianto realizzabile
          aggiorna_kW
          aggiorna_incentivi_installazione
          aggiorna_budget_annuale
          aggiorna_pf
          ;stampa
      ]
      [  ;; impianto non realizzato
        output-print   ("*************************************************************************************************")
        output-print  (word   "************** AGENTE " id  "realizzazione impianto impossibile : ROE insufficiente (dopo tentato ridimensionamento)") 
        output-print  (word   "DIE")
        output-print   ("*************************************************************************************************")
        set flag_roe true
        set flag_sum_roe_morti true
        set flag_sum_roe_stimato_morti true
        muori
      ]
    ] 
    [
      calcola_tariffe_ce
      calcola_fascia_potenza
      stima_roe
      if valutaincentivi = false 
      [
        output-print         ("*************************************************************************************************")
        output-print  (word   "************** AGENTE " id  "realizzazione impianto impossibile : Ridimensionamento non accettato") 
        output-print  (word   "DIE")
        output-print   ("*************************************************************************************************")
        set count_pf count_pf - 1
        ;show "realizzazione impianto impossibile : Ridimensionamento non accettato"
        
        ifelse anno = 2007 [ set totneg2007 totneg2007 + 1 ][
        ifelse anno = 2008 [ set totneg2008 totneg2008 + 1 ][
        ifelse anno = 2009 [ set totneg2009 totneg2009 + 1 ][
        ifelse anno = 2010 [ set totneg2010 totneg2010 + 1 ][
        ifelse anno = 2011 [ set totneg2011 totneg2011 + 1 ][
        ifelse anno = 2012 [ set totneg2012 totneg2012 + 1 ][
        ifelse anno = 2013 [ set totneg2013 totneg2013 + 1 ][
        ifelse anno = 2014 [ set totneg2014 totneg2014 + 1 ][
        ifelse anno = 2015 [ set totneg2015 totneg2015 + 1 ][
        ifelse anno = 2016 [ set totneg2016 totneg2016 + 1 ][
           ;; default case 
        ]]]]]]]]]]
      ]
      set mortoxm2 true
      muori
    ]
end

;; VALUTAZIONE IPOTESI PRESTITO
to accetta_prestito
  let Sforo_Budget (costo_impianto - ifin + intRegione) - Budget
  ifelse (Sforo_Budget <= round ( ( Budget * ( %ostinazione + influenza * sensibilita )) / 100 ) )
    [
      ;;set size dimensione_impianto / scala_dim_impianto
      set color red
      set prestito true
      set importo_prestito  Sforo_Budget
      calcola_interessi
      calcola_costi_impianto
      calcola_fascia_potenza
      ;; calcola_tariffa_gse versione senza CE
      calcola_tariffe_ce
      stima_roe
      ;; decisione presa anche sulla base del roe stimato: se è minore di quello minimo l'agente non realizza l'impianto
      ifelse (roe_stimato > roe_minimo)[ ;; impianto realizzabile
          aggiorna_kW
          aggiorna_incentivi_installazione
          aggiorna_budget_annuale
          aggiorna_pf
          ;stampa
      ]
      [  ;; impianto non realizzato
        output-print   ("*************************************************************************************************")
        output-print  (word   "************** AGENTE " id  "realizzazione impianto impossibile : ROE insufficiente (dopo tentato prestito)") 
        output-print  (word   "DIE")
        output-print   ("*************************************************************************************************")
        set flag_roe true
        set flag_sum_roe_morti true
        set flag_sum_roe_stimato_morti true
        muori
      ]      
    ] 
    [
      calcola_tariffe_ce
      calcola_fascia_potenza
      stima_roe
      if valutaincentivi = false
      [
        output-print         ("*************************************************************************************************")
        output-print  (word   "************** AGENTE " id  "realizzazione impianto impossibile : Prestito non accettato**************") 
        output-print  (word   "DIE")
        output-print   ("")
        set count_pf count_pf - 1
        ;show "realizzazione impianto impossibile : Prestito non accettato**************"
        set  totnegsoldi totnegsoldi + 1
        ifelse anno = 2007 [ set totneg2007 totneg2007 + 1 ][
        ifelse anno = 2008 [ set totneg2008 totneg2008 + 1 ][
        ifelse anno = 2009 [ set totneg2009 totneg2009 + 1 ][
        ifelse anno = 2010 [ set totneg2010 totneg2010 + 1 ][
        ifelse anno = 2011 [ set totneg2011 totneg2011 + 1 ][
        ifelse anno = 2012 [ set totneg2012 totneg2012 + 1 ][
        ifelse anno = 2013 [ set totneg2013 totneg2013 + 1 ][
        ifelse anno = 2014 [ set totneg2014 totneg2014 + 1 ][
        ifelse anno = 2015 [ set totneg2015 totneg2015 + 1 ][
        ifelse anno = 2016 [ set totneg2016 totneg2016 + 1 ][
           ;; default case 
        ]]]]]]]]]]
         
      ]      
      muori
    ]
end  

;; PROCEDURA PER IL CALCOLO DEGLI INTERESSI LEGATI AL PRESTITO
;imposta la fascia di potenza da 1 a 6 d la dimensione della casetta
to calcola_interessi
  ;;calcolo rata alla francese
  set rata_annuale_prestito (round (( importo_prestito * (Percentuale_Interessi_Prestito / 100) ) / (1 - ( (1 + (Percentuale_Interessi_Prestito / 100) ) ^ (- Anni_Restituzione_Prestiti) ) ) ) )
  set interessi_prestito ( rata_annuale_prestito *  Anni_Restituzione_Prestiti ) - importo_prestito
end

;calcola la rata annuale da versare alla regione in caso l'incentivo sia a rotazione
to calcola_rata_regione
  ;;calcolo rata alla francese
  set rataReg (round (( costo_impianto * (InterRegione / 100) ) / (1 - ( (1 + (InterRegione / 100) ) ^ (- Anni_Restituzione_mutuo_regione) ) ) ) ) 
  ;show rataReg
end

;calcola la rata annuale per il mutuo da versare alla banca in caso l'incentivo sia a garanzia
to calcola_rata_banca
  ;;calcolo rata alla francese
  set rataBanca (round (( costo_impianto * (InterBanca / 100) ) / (1 - ( (1 + (InterBanca / 100) ) ^ (- Anni_Restituzione_mutuo_banca) ) ) ) )   
  set guadagnobanca ( rataBanca *  Anni_Restituzione_mutuo_banca ) - costo_impianto
end

;;PROCEDURA ASSEGNAZIONE FASCIA POTENZA da 1 a 6
to calcola_fascia_potenza
  set potenza_impianto dimensione_impianto / m2Kwp;calcolo potenza impianto
  ifelse ( potenza_impianto >= 1 and potenza_impianto <= 3 )
    [
      set fascia_potenza  1
      set size  (scala_dim_impianto + 0.4) * fascia_potenza
      set tipologia_impianto "Su edificio piccolo"
    ]
    [
      ifelse ( potenza_impianto > 3 and potenza_impianto <= 20 )
      [
        set fascia_potenza  2
        set size (scala_dim_impianto + 0.4) * fascia_potenza
        set tipologia_impianto "Su edificio piccolo"
      ]
      [
        ifelse ( potenza_impianto > 20 and potenza_impianto <= 200 )
        [
          set fascia_potenza  3
          set size (scala_dim_impianto + 0.4) * fascia_potenza
          set tipologia_impianto "Su edificio piccolo"
        ]
        [
          ifelse ( potenza_impianto > 200 and potenza_impianto <= 1000 )
          [
            set fascia_potenza  4
            set tipologia_impianto "Su edificio piccolo"
            set size (scala_dim_impianto + 0.4) * fascia_potenza
            
          ]
          [
            ifelse ( potenza_impianto > 1000 and potenza_impianto <= 5000 )
            [
              set fascia_potenza  5
              set tipologia_impianto "Su edificio grande"
              set size (scala_dim_impianto + 0.4) * fascia_potenza
              
            ]
            [
              set fascia_potenza  6
              set tipologia_impianto "Su edificio grande"
              set size (scala_dim_impianto + 0.4) * fascia_potenza
              
            ]
          ]
        ]
      ]
    ]
end  

;; STAMPA A VIDEO DETTAGLI IMPIANTO APPENA REALIZZATO
to stampa
  output-print           ("****************************************************************************************************")
  output-print  (word   "********************************* AGENTE " id  " realizzato impianto********************************** ")  
  output-print  (word   "*******************************************DATI IMPIANTO******************************************** ")
  output-print  (word   "Dimensione: " dimensione_impianto " m2")
  output-print  (word   "Costo: " costo_impianto " euro")
  output-print  (word   "Potenza: " potenza_impianto " kWp")
  output-print  (word   "Fascia Potenza: " fascia_potenza)
  output-print  (word   "Tipologia Impianto: "tipologia_impianto)
  output-show ( word    "Anno impianto "  anno_realizzazione " Semestre " semestre_realizzazione)
  output-print  (word   "Conto Energia: " conto_energia)
  output-show ( word    " Tariffa ominocompresiva "    tariffa_omnicomprensiva " Tariffa autoconsumo " tariffa_autoconsumo )
  output-show ( word    " Tariffa incentivante  " tariffa_incentivante ) 
  output-show ( word    " Prezzi minimi gse  " prezzi_minimi_gse ) 
  output-print  (word   "Incentivi Installazione: " incentivo_installazione "euro Ridimensionamento: " ridimensionamento " Prestito: " prestito )
  output-print     ("******************************************************************************************************")
end

;; OBSERVER AGGIORNA LA POTENZA INSTALLATA
to aggiorna_kW
  ;; aggiornamento potenza impianti installati annualmente
  ifelse anno_realizzazione = 2007 [ set kW2007 kW2007 + potenza_impianto ][
  ifelse anno_realizzazione = 2008 [ set kW2008 kW2008 + potenza_impianto ][
  ifelse anno_realizzazione = 2009 [ set kW2009 kW2009 + potenza_impianto ][
  ifelse anno_realizzazione = 2010 [ set kW2010 kW2010 + potenza_impianto ][
  ifelse anno_realizzazione = 2011 [ set kW2011 kW2011 + potenza_impianto ][
  ifelse anno_realizzazione = 2012 [ set kW2012 kW2012 + potenza_impianto ][
  ifelse anno_realizzazione = 2013 [ set kW2013 kW2013 + potenza_impianto ][
  ifelse anno_realizzazione = 2014 [ set kW2014 kW2014 + potenza_impianto ][
  ifelse anno_realizzazione = 2015 [ set kW2015 kW2015 + potenza_impianto ][
  ifelse anno_realizzazione = 2016 [ set kW2016 kW2016 + potenza_impianto ][
       ;; default case 
  ]]]]]]]]]]
  
  aggiorna_kw_CE
  aggiorna_kw_FP
  
  ;; aggiornamento kWTOTALI
  set kWTOT kWTOT + potenza_impianto
  
  ;; per tenere traccia dei kw installati ogni semestre
  set kw_sum kw_sum + potenza_impianto
end


;; aggiorna la potenza installata suddivisa per Conto Energia 
to aggiorna_kw_CE
  ;; aggiornamento potenza impianti installati per CE
  ifelse conto_energia = 2 [ set kW_2CE kW_2CE + potenza_impianto][
  ifelse conto_energia = 3 [ set kW_3CE kW_3CE + potenza_impianto][
  ifelse conto_energia = 4 [ set kW_4CE kW_4CE + potenza_impianto][
  ifelse conto_energia = 5 [ set kW_5CE kW_5CE + potenza_impianto][
    ;; default case
  ]]]]
  
  ;; aggiornamento potenza impianti installati annualmente per CE
  ifelse (anno_realizzazione = 2007 and conto_energia = 2) [ set kW_2CE_2007 kW_2CE_2007 + potenza_impianto][
  ifelse (anno_realizzazione = 2008 and conto_energia = 2) [ set kW_2CE_2008 kW_2CE_2008 + potenza_impianto][
  ifelse (anno_realizzazione = 2009 and conto_energia = 2) [ set kW_2CE_2009 kW_2CE_2009 + potenza_impianto][
  ifelse (anno_realizzazione = 2010 and conto_energia = 2) [ set kW_2CE_2010 kW_2CE_2010 + potenza_impianto][  
  ifelse (anno_realizzazione = 2011 and conto_energia = 2) [ set kW_2CE_2011 kW_2CE_2011 + potenza_impianto][
  ifelse (anno_realizzazione = 2011 and conto_energia = 3) [ set kW_3CE_2011 kW_3CE_2011 + potenza_impianto][
  ifelse (anno_realizzazione = 2011 and conto_energia = 4) [ set kW_4CE_2011 kW_4CE_2011 + potenza_impianto][
  ifelse (anno_realizzazione = 2012 and conto_energia = 4) [ set kW_4CE_2012 kW_4CE_2012 + potenza_impianto][
  ifelse (anno_realizzazione = 2012 and conto_energia = 5) [ set kW_5CE_2012 kW_5CE_2012 + potenza_impianto][
  ifelse (anno_realizzazione = 2013 and conto_energia = 5) [ set kW_5CE_2013 kW_5CE_2013 + potenza_impianto][
    ;; default case
  ]]]]]]]]]]
end

;; aggiorna la potenza installata suddivisa per Fascia Potenza
to aggiorna_kw_FP
  ;; aggiornamento potenza impianti installati per FP
  ifelse fascia_potenza = 1 [ set kW_1FP kW_1FP + potenza_impianto][
  ifelse fascia_potenza = 2 [ set kW_2FP kW_2FP + potenza_impianto][
  ifelse fascia_potenza = 3 [ set kW_3FP kW_3FP + potenza_impianto][
  ifelse fascia_potenza = 4 [ set kW_4FP kW_4FP + potenza_impianto][
  ifelse fascia_potenza = 5 [ set kW_5FP kW_5FP + potenza_impianto][
  ifelse fascia_potenza = 6 [ set kW_6FP kW_6FP + potenza_impianto][
    ;; default case
  ]]]]]]
  
  ;; aggiornamento potenza impianti installati per FP ogni anno
  ifelse (fascia_potenza = 1 and anno_realizzazione = 2007) [ set kW_1FP_2007 kW_1FP_2007 + potenza_impianto][
  ifelse (fascia_potenza = 1 and anno_realizzazione = 2008) [ set kW_1FP_2008 kW_1FP_2008 + potenza_impianto][
  ifelse (fascia_potenza = 1 and anno_realizzazione = 2009) [ set kW_1FP_2009 kW_1FP_2009 + potenza_impianto][
  ifelse (fascia_potenza = 1 and anno_realizzazione = 2010) [ set kW_1FP_2010 kW_1FP_2010 + potenza_impianto][
  ifelse (fascia_potenza = 1 and anno_realizzazione = 2011) [ set kW_1FP_2011 kW_1FP_2011 + potenza_impianto][
  ifelse (fascia_potenza = 1 and anno_realizzazione = 2012) [ set kW_1FP_2012 kW_1FP_2012 + potenza_impianto][
  ifelse (fascia_potenza = 1 and anno_realizzazione = 2013) [ set kW_1FP_2013 kW_1FP_2013 + potenza_impianto][
  ifelse (fascia_potenza = 2 and anno_realizzazione = 2007) [ set kW_2FP_2007 kW_2FP_2007 + potenza_impianto][
  ifelse (fascia_potenza = 2 and anno_realizzazione = 2008) [ set kW_2FP_2008 kW_2FP_2008 + potenza_impianto][
  ifelse (fascia_potenza = 2 and anno_realizzazione = 2009) [ set kW_2FP_2009 kW_2FP_2009 + potenza_impianto][
  ifelse (fascia_potenza = 2 and anno_realizzazione = 2010) [ set kW_2FP_2010 kW_2FP_2010 + potenza_impianto][
  ifelse (fascia_potenza = 2 and anno_realizzazione = 2011) [ set kW_2FP_2011 kW_2FP_2011 + potenza_impianto][
  ifelse (fascia_potenza = 2 and anno_realizzazione = 2012) [ set kW_2FP_2012 kW_2FP_2012 + potenza_impianto][
  ifelse (fascia_potenza = 2 and anno_realizzazione = 2013) [ set kW_2FP_2013 kW_2FP_2013 + potenza_impianto][
  ifelse (fascia_potenza = 3 and anno_realizzazione = 2007) [ set kW_3FP_2007 kW_3FP_2007 + potenza_impianto][
  ifelse (fascia_potenza = 3 and anno_realizzazione = 2008) [ set kW_3FP_2008 kW_3FP_2008 + potenza_impianto][
  ifelse (fascia_potenza = 3 and anno_realizzazione = 2009) [ set kW_3FP_2009 kW_3FP_2009 + potenza_impianto][
  ifelse (fascia_potenza = 3 and anno_realizzazione = 2010) [ set kW_3FP_2010 kW_3FP_2010 + potenza_impianto][
  ifelse (fascia_potenza = 3 and anno_realizzazione = 2011) [ set kW_3FP_2011 kW_3FP_2011 + potenza_impianto][
  ifelse (fascia_potenza = 3 and anno_realizzazione = 2012) [ set kW_3FP_2012 kW_3FP_2012 + potenza_impianto][
  ifelse (fascia_potenza = 3 and anno_realizzazione = 2013) [ set kW_3FP_2013 kW_3FP_2013 + potenza_impianto][
  ifelse (fascia_potenza = 4 and anno_realizzazione = 2007) [ set kW_4FP_2007 kW_4FP_2007 + potenza_impianto][
  ifelse (fascia_potenza = 4 and anno_realizzazione = 2008) [ set kW_4FP_2008 kW_4FP_2008 + potenza_impianto][
  ifelse (fascia_potenza = 4 and anno_realizzazione = 2009) [ set kW_4FP_2009 kW_4FP_2009 + potenza_impianto][
  ifelse (fascia_potenza = 4 and anno_realizzazione = 2010) [ set kW_4FP_2010 kW_4FP_2010 + potenza_impianto][
  ifelse (fascia_potenza = 4 and anno_realizzazione = 2011) [ set kW_4FP_2011 kW_4FP_2011 + potenza_impianto][
  ifelse (fascia_potenza = 4 and anno_realizzazione = 2012) [ set kW_4FP_2012 kW_4FP_2012 + potenza_impianto][
  ifelse (fascia_potenza = 4 and anno_realizzazione = 2013) [ set kW_4FP_2013 kW_4FP_2013 + potenza_impianto][
  ifelse (fascia_potenza = 5 and anno_realizzazione = 2007) [ set kW_5FP_2007 kW_5FP_2007 + potenza_impianto][
  ifelse (fascia_potenza = 5 and anno_realizzazione = 2008) [ set kW_5FP_2008 kW_5FP_2008 + potenza_impianto][
  ifelse (fascia_potenza = 5 and anno_realizzazione = 2009) [ set kW_5FP_2009 kW_5FP_2009 + potenza_impianto][
  ifelse (fascia_potenza = 5 and anno_realizzazione = 2010) [ set kW_5FP_2010 kW_5FP_2010 + potenza_impianto][
  ifelse (fascia_potenza = 5 and anno_realizzazione = 2011) [ set kW_5FP_2011 kW_5FP_2011 + potenza_impianto][
  ifelse (fascia_potenza = 5 and anno_realizzazione = 2012) [ set kW_5FP_2012 kW_5FP_2012 + potenza_impianto][
  ifelse (fascia_potenza = 5 and anno_realizzazione = 2013) [ set kW_5FP_2013 kW_5FP_2013 + potenza_impianto][
  ifelse (fascia_potenza = 6 and anno_realizzazione = 2007) [ set kW_6FP_2007 kW_6FP_2007 + potenza_impianto][
  ifelse (fascia_potenza = 6 and anno_realizzazione = 2008) [ set kW_6FP_2008 kW_6FP_2008 + potenza_impianto][
  ifelse (fascia_potenza = 6 and anno_realizzazione = 2009) [ set kW_6FP_2009 kW_6FP_2009 + potenza_impianto][
  ifelse (fascia_potenza = 6 and anno_realizzazione = 2010) [ set kW_6FP_2010 kW_6FP_2010 + potenza_impianto][
  ifelse (fascia_potenza = 6 and anno_realizzazione = 2011) [ set kW_6FP_2011 kW_6FP_2011 + potenza_impianto][
  ifelse (fascia_potenza = 6 and anno_realizzazione = 2012) [ set kW_6FP_2012 kW_6FP_2012 + potenza_impianto][
  ifelse (fascia_potenza = 6 and anno_realizzazione = 2013) [ set kW_6FP_2013 kW_6FP_2013 + potenza_impianto][
  ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
  
end


;; OBSERVER AGGIORNA IL COUNT DEGLI AGENTI
to aggiorna_pf
  ;;aggiornamento kW installati per ogni anno
  ifelse anno_realizzazione = 2007 [ set count_pf2007 count_pf2007 + 1 ][
  ifelse anno_realizzazione = 2008 [ set count_pf2008 count_pf2008 + 1 ][
  ifelse anno_realizzazione = 2009 [ set count_pf2009 count_pf2009 + 1 ][
  ifelse anno_realizzazione = 2010 [ set count_pf2010 count_pf2010 + 1 ][
  ifelse anno_realizzazione = 2011 [ set count_pf2011 count_pf2011 + 1 ][
  ifelse anno_realizzazione = 2012 [ set count_pf2012 count_pf2012 + 1 ][
  ifelse anno_realizzazione = 2013 [ set count_pf2013 count_pf2013 + 1 ][
  ifelse anno_realizzazione = 2014 [ set count_pf2014 count_pf2014 + 1 ][
  ifelse anno_realizzazione = 2015 [ set count_pf2015 count_pf2015 + 1 ][
  ifelse anno_realizzazione = 2016 [ set count_pf2016 count_pf2016 + 1 ][
       ;; default case 
  ]]]]]]]]]]
  
  aggiorna_pf_FP
  aggiorna_pf_CE
end

;; aggiorna il numero di impianti PV divisi per Fascia Potenza
to aggiorna_pf_FP
  ifelse fascia_potenza = 1 [ set count_pf_1FP count_pf_1FP + 1][
  ifelse fascia_potenza = 2 [ set count_pf_2FP count_pf_2FP + 1][
  ifelse fascia_potenza = 3 [ set count_pf_3FP count_pf_3FP + 1][
  ifelse fascia_potenza = 4 [ set count_pf_4FP count_pf_4FP + 1][
  ifelse fascia_potenza = 5 [ set count_pf_5FP count_pf_5FP + 1][
  ifelse fascia_potenza = 6 [ set count_pf_6FP count_pf_6FP + 1][
    ;; default case
  ]]]]]]
  
  ;; aggiornamento numero impianti installati per FP ogni anno
  ifelse (fascia_potenza = 1 and anno_realizzazione = 2007) [ set count_pf_1FP_2007 count_pf_1FP_2007 + 1][
  ifelse (fascia_potenza = 1 and anno_realizzazione = 2008) [ set count_pf_1FP_2008 count_pf_1FP_2008 + 1][
  ifelse (fascia_potenza = 1 and anno_realizzazione = 2009) [ set count_pf_1FP_2009 count_pf_1FP_2009 + 1][
  ifelse (fascia_potenza = 1 and anno_realizzazione = 2010) [ set count_pf_1FP_2010 count_pf_1FP_2010 + 1][
  ifelse (fascia_potenza = 1 and anno_realizzazione = 2011) [ set count_pf_1FP_2011 count_pf_1FP_2011 + 1][
  ifelse (fascia_potenza = 1 and anno_realizzazione = 2012) [ set count_pf_1FP_2012 count_pf_1FP_2012 + 1][
  ifelse (fascia_potenza = 1 and anno_realizzazione = 2013) [ set count_pf_1FP_2013 count_pf_1FP_2013 + 1][
  ifelse (fascia_potenza = 2 and anno_realizzazione = 2007) [ set count_pf_2FP_2007 count_pf_2FP_2007 + 1][
  ifelse (fascia_potenza = 2 and anno_realizzazione = 2008) [ set count_pf_2FP_2008 count_pf_2FP_2008 + 1][
  ifelse (fascia_potenza = 2 and anno_realizzazione = 2009) [ set count_pf_2FP_2009 count_pf_2FP_2009 + 1][
  ifelse (fascia_potenza = 2 and anno_realizzazione = 2010) [ set count_pf_2FP_2010 count_pf_2FP_2010 + 1][
  ifelse (fascia_potenza = 2 and anno_realizzazione = 2011) [ set count_pf_2FP_2011 count_pf_2FP_2011 + 1][
  ifelse (fascia_potenza = 2 and anno_realizzazione = 2012) [ set count_pf_2FP_2012 count_pf_2FP_2012 + 1][
  ifelse (fascia_potenza = 2 and anno_realizzazione = 2013) [ set count_pf_2FP_2013 count_pf_2FP_2013 + 1][
  ifelse (fascia_potenza = 3 and anno_realizzazione = 2007) [ set count_pf_3FP_2007 count_pf_3FP_2007 + 1][
  ifelse (fascia_potenza = 3 and anno_realizzazione = 2008) [ set count_pf_3FP_2008 count_pf_3FP_2008 + 1][
  ifelse (fascia_potenza = 3 and anno_realizzazione = 2009) [ set count_pf_3FP_2009 count_pf_3FP_2009 + 1][
  ifelse (fascia_potenza = 3 and anno_realizzazione = 2010) [ set count_pf_3FP_2010 count_pf_3FP_2010 + 1][
  ifelse (fascia_potenza = 3 and anno_realizzazione = 2011) [ set count_pf_3FP_2011 count_pf_3FP_2011 + 1][
  ifelse (fascia_potenza = 3 and anno_realizzazione = 2012) [ set count_pf_3FP_2012 count_pf_3FP_2012 + 1][
  ifelse (fascia_potenza = 3 and anno_realizzazione = 2013) [ set count_pf_3FP_2013 count_pf_3FP_2013 + 1][
  ifelse (fascia_potenza = 4 and anno_realizzazione = 2007) [ set count_pf_4FP_2007 count_pf_4FP_2007 + 1][
  ifelse (fascia_potenza = 4 and anno_realizzazione = 2008) [ set count_pf_4FP_2008 count_pf_4FP_2008 + 1][
  ifelse (fascia_potenza = 4 and anno_realizzazione = 2009) [ set count_pf_4FP_2009 count_pf_4FP_2009 + 1][
  ifelse (fascia_potenza = 4 and anno_realizzazione = 2010) [ set count_pf_4FP_2010 count_pf_4FP_2010 + 1][
  ifelse (fascia_potenza = 4 and anno_realizzazione = 2011) [ set count_pf_4FP_2011 count_pf_4FP_2011 + 1][
  ifelse (fascia_potenza = 4 and anno_realizzazione = 2012) [ set count_pf_4FP_2012 count_pf_4FP_2012 + 1][
  ifelse (fascia_potenza = 4 and anno_realizzazione = 2013) [ set count_pf_4FP_2013 count_pf_4FP_2013 + 1][
  ifelse (fascia_potenza = 5 and anno_realizzazione = 2007) [ set count_pf_5FP_2007 count_pf_5FP_2007 + 1][
  ifelse (fascia_potenza = 5 and anno_realizzazione = 2008) [ set count_pf_5FP_2008 count_pf_5FP_2008 + 1][
  ifelse (fascia_potenza = 5 and anno_realizzazione = 2009) [ set count_pf_5FP_2009 count_pf_5FP_2009 + 1][
  ifelse (fascia_potenza = 5 and anno_realizzazione = 2010) [ set count_pf_5FP_2010 count_pf_5FP_2010 + 1][
  ifelse (fascia_potenza = 5 and anno_realizzazione = 2011) [ set count_pf_5FP_2011 count_pf_5FP_2011 + 1][
  ifelse (fascia_potenza = 5 and anno_realizzazione = 2012) [ set count_pf_5FP_2012 count_pf_5FP_2012 + 1][
  ifelse (fascia_potenza = 5 and anno_realizzazione = 2013) [ set count_pf_5FP_2013 count_pf_5FP_2013 + 1][
  ifelse (fascia_potenza = 6 and anno_realizzazione = 2007) [ set count_pf_6FP_2007 count_pf_6FP_2007 + 1][
  ifelse (fascia_potenza = 6 and anno_realizzazione = 2008) [ set count_pf_6FP_2008 count_pf_6FP_2008 + 1][
  ifelse (fascia_potenza = 6 and anno_realizzazione = 2009) [ set count_pf_6FP_2009 count_pf_6FP_2009 + 1][
  ifelse (fascia_potenza = 6 and anno_realizzazione = 2010) [ set count_pf_6FP_2010 count_pf_6FP_2010 + 1][
  ifelse (fascia_potenza = 6 and anno_realizzazione = 2011) [ set count_pf_6FP_2011 count_pf_6FP_2011 + 1][
  ifelse (fascia_potenza = 6 and anno_realizzazione = 2012) [ set count_pf_6FP_2012 count_pf_6FP_2012 + 1][
  ifelse (fascia_potenza = 6 and anno_realizzazione = 2013) [ set count_pf_6FP_2013 count_pf_6FP_2013 + 1][
  ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
end

;; aggiorna il numero di impianti PV divisi per Conto Energia
to aggiorna_pf_CE
  ifelse conto_energia = 2 [ set count_pf_2CE count_pf_2CE + 1][
  ifelse conto_energia = 3 [ set count_pf_3CE count_pf_3CE + 1][
  ifelse conto_energia = 4 [ set count_pf_4CE count_pf_4CE + 1][
  ifelse conto_energia = 5 [ set count_pf_5CE count_pf_5CE + 1][
    ;; default case
  ]]]]
end

;; OBSERVER AGGIORNA SPESA INCENTIVI INSTALLAZIONE
to aggiorna_incentivi_installazione
  
  ;;aggiornamento incentivi isntallazione per ogni anno
  ifelse anno_realizzazione = 2007 [ set INCENTIVO_INST2007 INCENTIVO_INST2007 + incentivo_installazione ][
  ifelse anno_realizzazione = 2008 [ set INCENTIVO_INST2008 INCENTIVO_INST2008 + incentivo_installazione ][
  ifelse anno_realizzazione = 2009 [ set INCENTIVO_INST2009 INCENTIVO_INST2009 + incentivo_installazione ][
  ifelse anno_realizzazione = 2010 [ set INCENTIVO_INST2010 INCENTIVO_INST2010 + incentivo_installazione ][
  ifelse anno_realizzazione = 2011 [ set INCENTIVO_INST2011 INCENTIVO_INST2011 + incentivo_installazione ][
  ifelse anno_realizzazione = 2012 [ set INCENTIVO_INST2012 INCENTIVO_INST2012 + incentivo_installazione ][
  ifelse anno_realizzazione = 2013 [ set INCENTIVO_INST2013 INCENTIVO_INST2013 + incentivo_installazione ][
  ifelse anno_realizzazione = 2014 [ set INCENTIVO_INST2014 INCENTIVO_INST2014 + incentivo_installazione ][
  ifelse anno_realizzazione = 2015 [ set INCENTIVO_INST2015 INCENTIVO_INST2015 + incentivo_installazione ][
  ifelse anno_realizzazione = 2016 [ set INCENTIVO_INST2016 INCENTIVO_INST2016 + incentivo_installazione ][
       ;; default case 
  ]]]]]]]]]]
  
  ;;aggiornamento incentivi installazione TOTALI
  set INCENTIVO_INSTOT INCENTIVO_INSTOT + incentivo_installazione  
end

;;salva budget corrente alla fine di ogni anno
to aggiorna_budget_annuale
  
  ifelse anno_realizzazione = 2007 [ set Budget2007 BudgetCorrente ][
  ifelse anno_realizzazione = 2008 [ set Budget2008 BudgetCorrente ][
  ifelse anno_realizzazione = 2009 [ set Budget2009 BudgetCorrente ][
  ifelse anno_realizzazione = 2010 [ set Budget2010 BudgetCorrente ][
  ifelse anno_realizzazione = 2011 [ set Budget2011 BudgetCorrente ][
  ifelse anno_realizzazione = 2012 [ set Budget2012 BudgetCorrente ][
  ifelse anno_realizzazione = 2013 [ set Budget2013 BudgetCorrente ][
  ifelse anno_realizzazione = 2014 [ set Budget2014 BudgetCorrente ][
  ifelse anno_realizzazione = 2015 [ set Budget2015 BudgetCorrente ][
  ifelse anno_realizzazione = 2016 [ set Budget2016 BudgetCorrente ][
       ;; default case 
  ]]]]]]]]]]
  
end

;;aumenta il budget regionale all'inizio di ogni nuovo anno (della quantità specificata negli appositi slider) - è un compito riservato all'agente della regione ar
to aggiorna_budget
  ask ar
  [
    ;;a partire dal secondo anno: nel 2007 il budget è dato direttamente da BudgetRegione
    ifelse anno = 2007 [ set BudgetCorrente BudgetCorrente ][
    ifelse anno = 2008 [ set  BudgetCorrente BudgetCorrente + (BudgetRegione2008 * 1000000) output-print (word ">>>>>>>>>> Aggiorno budget 2008 <<<<<<<<<" ) ][
    ifelse anno = 2009 [ set  BudgetCorrente BudgetCorrente + (BudgetRegione2009 * 1000000) output-print (word ">>>>>>>>>> Aggiorno budget 2009 <<<<<<<<<" ) ][
    ifelse anno = 2010 [ set  BudgetCorrente BudgetCorrente + (BudgetRegione2010 * 1000000) output-print (word ">>>>>>>>>> Aggiorno budget 2010 <<<<<<<<<" ) ][
    ifelse anno = 2011 [ set  BudgetCorrente BudgetCorrente + (BudgetRegione2011 * 1000000) output-print (word ">>>>>>>>>> Aggiorno budget 2011 <<<<<<<<<" ) ][
    ifelse anno = 2012 [ set  BudgetCorrente BudgetCorrente + (BudgetRegione2012 * 1000000) output-print (word ">>>>>>>>>> Aggiorno budget 2012 <<<<<<<<<" ) ][
    ifelse anno = 2013 [ set  BudgetCorrente BudgetCorrente + (BudgetRegione2013 * 1000000) output-print (word ">>>>>>>>>> Aggiorno budget 2013 <<<<<<<<<" ) ][
    ifelse anno = 2014 [ set  BudgetCorrente BudgetCorrente + (BudgetRegione2014 * 1000000) output-print (word ">>>>>>>>>> Aggiorno budget 2014 <<<<<<<<<" ) ][
    ifelse anno = 2015 [ set  BudgetCorrente BudgetCorrente + (BudgetRegione2015 * 1000000) output-print (word ">>>>>>>>>> Aggiorno budget 2015 <<<<<<<<<" ) ][
    ifelse anno = 2016 [ set  BudgetCorrente BudgetCorrente + (BudgetRegione2016 * 1000000) output-print (word ">>>>>>>>>> Aggiorno budget 2016 <<<<<<<<<" ) ][
      ;; default case 
      set Budget2017 BudgetCorrente ;;per tenere traccia del budget effettivo rimasto alla regione dopo che tutti gli impianti sono stati realizzati
    ]]]]]]]]]]
  ]
end

;; aggiorna i nuovi kw installati a livello regionale ogni anno
to aggiorna_kw_annui
  
    ifelse anno = 2007 [ set kw_installed_yearly kW2007 output-print (word ">>>>>>>>>> Aggiorno kw_installed_yearly2007 <<<<<<<<<" ) ][
    ifelse anno = 2008 [ set kw_installed_yearly kW2008 output-print (word ">>>>>>>>>> Aggiorno kw_installed_yearly2008 <<<<<<<<<" ) ][
    ifelse anno = 2009 [ set kw_installed_yearly kW2009 output-print (word ">>>>>>>>>> Aggiorno kw_installed_yearly2009 <<<<<<<<<" ) ][
    ifelse anno = 2010 [ set kw_installed_yearly kW2010 output-print (word ">>>>>>>>>> Aggiorno kw_installed_yearly2010 <<<<<<<<<" ) ][
    ifelse anno = 2011 [ set kw_installed_yearly kW2011 output-print (word ">>>>>>>>>> Aggiorno kw_installed_yearly2011 <<<<<<<<<" ) ][
    ifelse anno = 2012 [ set kw_installed_yearly kW2012 output-print (word ">>>>>>>>>> Aggiorno kw_installed_yearly2012 <<<<<<<<<" ) ][
    ifelse anno = 2013 [ set kw_installed_yearly kW2013 output-print (word ">>>>>>>>>> Aggiorno kw_installed_yearly2013 <<<<<<<<<" ) ][
    ifelse anno = 2014 [ set kw_installed_yearly kW2014 output-print (word ">>>>>>>>>> Aggiorno kw_installed_yearly2014 <<<<<<<<<" ) ][
    ifelse anno = 2015 [ set kw_installed_yearly kW2015 output-print (word ">>>>>>>>>> Aggiorno kw_installed_yearly2015 <<<<<<<<<" ) ][
    ifelse anno = 2016 [ set kw_installed_yearly kW2016 output-print (word ">>>>>>>>>> Aggiorno kw_installed_yearly2016 <<<<<<<<<" ) ][
      ;; default case 
      set kw_installed_yearly kW2016 ;; da quando non viene installata nuova potenza quindi lascio semplicemente il valore dell'anno passato
    ]]]]]]]]]]
    
end

;; aggiorna i nuovi kw installati ogni semestre
to aggiorna_kw_semestre
  set kw_installed_semester kw_sum
  set kw_sum 0
end

;; modifica ogni anno il grado di diffusione della conoscenza relativa al fotovoltaico
to aggiorna_diffusione_conoscenza
  ;; versione iniziale, tipo varazione cablato nel codice
;  set percentuale_conoscenza_PV ( percentuale_conoscenza_PV * 2 ) ;; aumento lineare, coefficiente 2
;  set percentuale_conoscenza_PV ( percentuale_conoscenza_PV * 5 ) ;; aumento lineare, coefficiente 5
;  set percentuale_conoscenza_PV ( percentuale_conoscenza_PV * 19 ) ;; aumento lineare, coefficiente 10
;  set percentuale_conoscenza_PV ( 1 + percentuale_conoscenza_PV * percentuale_conoscenza_PV ) ;; aumento quadratico
;  set percentuale_conoscenza_PV ( 1 + percentuale_conoscenza_PV * percentuale_conoscenza_PV * percentuale_conoscenza_PV ) ;; aumento cubico

  ;; nuova versione
  ifelse (Tipo_variazione_conoscenza_PV = "Lineare") [ 
    set percentuale_conoscenza_PV ( percentuale_conoscenza_PV * coeff_variazione_conoscenza_PV ) ][
  ifelse (Tipo_variazione_conoscenza_PV = "Quadratico") [ 
    ifelse (percentuale_conoscenza_PV = 1) [ set percentuale_conoscenza_PV ( 1 + percentuale_conoscenza_PV * percentuale_conoscenza_PV ) ]
    [ set percentuale_conoscenza_PV ( percentuale_conoscenza_PV * percentuale_conoscenza_PV * coeff_variazione_conoscenza_PV )] ][
  ifelse (Tipo_variazione_conoscenza_PV = "Cubico") [ 
    ifelse (percentuale_conoscenza_PV = 1) [ set percentuale_conoscenza_PV ( 1 + percentuale_conoscenza_PV * percentuale_conoscenza_PV * percentuale_conoscenza_PV ) ]
    [ set percentuale_conoscenza_PV ( percentuale_conoscenza_PV * percentuale_conoscenza_PV * percentuale_conoscenza_PV * coeff_variazione_conoscenza_PV )] ][
      ;; default case 
    ]]]
end

;; CALCOLA LA PERCENTUALE DI AGENTI CHE DECIDONO DI EFFETTUARE L'IMPIANTO
to calcola_rapporto
  set perctotnegsoldi precision (totnegsoldi / (NAgentiFINAL * 10) * 100) 2
  set percneg2007 precision (totneg2007 / (NAgentiFINAL * 2)* 100 ) 2
  set percneg2008 precision (totneg2008 / (NAgentiFINAL * 2)* 100 ) 2
  set percneg2009 precision (totneg2009 / (NAgentiFINAL * 2)* 100 ) 2
  set percneg2010 precision (totneg2010 / (NAgentiFINAL * 2)* 100 ) 2
  set percneg2011 precision (totneg2011 / (NAgentiFINAL * 2)* 100 ) 2
  set percneg2012 precision (totneg2012 / (NAgentiFINAL * 2)* 100 ) 2
  set percneg2013 precision (totneg2013 / (NAgentiFINAL * 2)* 100 ) 2
  set percneg2014 precision (totneg2014 / (NAgentiFINAL * 2)* 100 ) 2
  set percneg2015 precision (totneg2015 / (NAgentiFINAL * 2)* 100 ) 2
  set percneg2016 precision (totneg2016 / (NAgentiFINAL * 2)* 100 ) 2
  
  set r2007  precision ((count_pf2007 * 100) / (NAgentiFINAL * 2)) 2
  set r2008  precision ((count_pf2008 * 100) / (NAgentiFINAL * 2)) 2
  set r2009  precision ((count_pf2009 * 100) / (NAgentiFINAL * 2)) 2
  set r2010  precision ((count_pf2010 * 100) / (NAgentiFINAL * 2)) 2
  set r2011  precision ((count_pf2011 * 100) / (NAgentiFINAL * 2)) 2
  set r2012  precision ((count_pf2012 * 100) / (NAgentiFINAL * 2)) 2
  set r2013  precision ((count_pf2013 * 100) / (NAgentiFINAL * 2)) 2
  set r2014  precision ((count_pf2014 * 100) / (NAgentiFINAL * 2)) 2
  set r2015  precision ((count_pf2015 * 100) / (NAgentiFINAL * 2)) 2
  set r2016  precision ((count_pf2016 * 100) / (NAgentiFINAL * 2)) 2
  
  ;; in NAgentiFInal * 10 il 10 rappresenta il numero dei semestri considerati
  ;; set percnegativa precision (totdied / (NAgentiFINAL * 10) * 100) 2
  ;; nel periodo 2007-2013 i semestri sono 14
  set percnegativa precision (totdied / (NAgentiFINAL * 14) * 100) 2
  set percpositive 100 - percnegativa
end


;; procedura per decidere a quale Conto Energia deve fare riferimento un agente
;; vedere ScelteProg.txt per una breve discussione a tal proposito
to set_conto_energia
  ;; la scelta viene fatta in base all'anno ed al semestre di realizzazione
  set anno_realizzazione anno
  set semestre_realizzazione time 
  ;; ricordare che, per convenzione: primo--> non implementato, secondo-->2, terzo-->3, quarto-->4, quinto-->5
  ifelse (anno_realizzazione = 2007 or anno_realizzazione = 2008 or anno_realizzazione = 2009 or anno_realizzazione = 2010)
  [;; periodo 2007-2010, secondo CE
    set conto_energia 2
  ];; fine periodo 2007-2010
  [;; else periodo 2011-2013
    ;; primo semestre 2011: Secondo e Terzo CE contemporaneamente
    ifelse(anno_realizzazione = 2011 and semestre_realizzazione = 1)
    [;; primo semestre 2011
      ;; dai dati storici, si osserva che nel primo semestre 2011 sono stati installati circa 54k impianti nel Secondo CE contro i 38k del Terzo -->
      ;; --> cerchiamo di riflettere questa distribuzione assegnando una probabilità maggiore al Secondo CE
      let rndm random 100
      ifelse(rndm < 60) ;; con prob. circa pari a 60% Secondo CE
      [
        set conto_energia 2
      ]
      [ ;; con prob. circa pari a 40% Terzo CE
        set conto_energia 3
      ]
    ];; fine primo semestre 2011
    [;; else secondo semestre 2011 - 2013
      ifelse(anno_realizzazione = 2011 and semestre_realizzazione = 2)
      [;; secondo semestre 2011
        set conto_energia 4
      ];; fine secondo semestre 2011
      [;; periodo 2012-2013
        ifelse(anno_realizzazione = 2012 and semestre_realizzazione = 1)
        [;; primo semestre 2012
          set conto_energia 4
        ];; fine primo semestre 2012
        [;; else secondo semestre 2012 - 2013
          set conto_energia 5 ;; in realtà non dovrei applicare il Quinto CE anche agli impianti del secondo semestre 2013
        ];; else secondo semestre 2012 - 2013
      ];; fine periodo 2012-2013
    ];; fine else secondo semestre 2011 - 2013
  ];; fine else periodo 2011-2013
end


;; PROCEDURA PER LA LETTURA DEI PREZZI MINIMI EFFETIVAMENTE APPLICATI DAL GSE NEL 2008-2012 (dati prelevati da file in cartella di lancio)
to calcola_prezzi_minimi_gse
  ;set prezzi_minimi_gse []
  ifelse (anno = 2007 and file-exists? "PrezziMinimi2008.txt" ) ;; in realtà nel 2007 non è ancora previsto il ritiro dedicato --> modello semplificato
  [
    file-open "PrezziMinimi2008.txt"
               while [ not file-at-end? ]
               [
                 let letto file-read
                 set prezzi_minimi_gse fput letto prezzi_minimi_gse
               ]
               file-close
  ]
  [;; else non 2007
    ifelse (anno = 2008 and file-exists? "PrezziMinimi2008.txt" )
    [
      file-open "PrezziMinimi2008.txt"
               while [ not file-at-end? ]
               [
                 let letto file-read
                 set prezzi_minimi_gse fput letto prezzi_minimi_gse
               ]
               file-close
    ]
    [;; else non 2008
      ifelse (anno = 2009 and file-exists? "PrezziMinimi2009.txt" )
      [
        file-open "PrezziMinimi2009.txt"
               while [ not file-at-end? ]
               [
                 let letto file-read
                 set prezzi_minimi_gse fput letto prezzi_minimi_gse
               ]
               file-close
      ]
      [;; else non 2009
        ifelse (anno = 2010 and file-exists? "PrezziMinimi2010.txt" )
        [
          file-open "PrezziMinimi2010.txt"
               while [ not file-at-end? ]
               [
                 let letto file-read
                 set prezzi_minimi_gse lput letto prezzi_minimi_gse
               ]
               file-close
        ]
        [;; else non 2010
          ifelse (anno = 2011 and file-exists? "PrezziMinimi2011.txt" )
          [
            file-open "PrezziMinimi2011.txt"
               while [ not file-at-end? ]
               [
                 let letto file-read
                 set prezzi_minimi_gse fput letto prezzi_minimi_gse
               ]
               file-close
          ]
          [;; else non 2011
            if(time = 1 and anno = 2012 and file-exists? "PrezziMinimi2012.txt" ) ;; nel 2012 i prezzi minimi hanno senso solo nel primo semestre, quando è in vigore ancora il Quarto CE
            [
               file-open "PrezziMinimi2012.txt"
               while [ not file-at-end? ]
               [
                 let letto file-read
                 set prezzi_minimi_gse fput letto prezzi_minimi_gse
               ]
               file-close
            ]
          ];; fine else non 2011
        ];; fine else non 2010
      ];; fine else non 2009
    ];; fine else non 2008
  ];; fine else non 2007
end


;; PROCEDURA PER LA LETTURA DEI PREZZI dell'energia elettrica al consumatore finale (da me stimati per il periodo 2007-2013)
to calcola_prezzi_elettricita_consumatore
  ifelse (anno = 2007 and file-exists? "PrezziConsumatore2007.txt" ) 
  [
    file-open "PrezziConsumatore2007.txt"
               while [ not file-at-end? ]
               [
                 let letto file-read
                 set costo_kwh_consumo fput letto costo_kwh_consumo
               ]
               file-close
  ]
  [;; else non 2007
    ifelse (anno = 2008 and file-exists? "PrezziConsumatore2008.txt" )
    [
      file-open "PrezziConsumatore2008.txt"
               while [ not file-at-end? ]
               [
                 let letto file-read
                 set costo_kwh_consumo fput letto costo_kwh_consumo
               ]
               file-close
    ]
    [;; else non 2008
      ifelse (anno = 2009 and file-exists? "PrezziConsumatore2009.txt" )
      [
        file-open "PrezziConsumatore2009.txt"
               while [ not file-at-end? ]
               [
                 let letto file-read
                 set costo_kwh_consumo fput letto costo_kwh_consumo
               ]
               file-close
      ]
      [;; else non 2009
        ifelse (anno = 2010 and file-exists? "PrezziConsumatore2010.txt" )
        [
          file-open "PrezziConsumatore2010.txt"
               while [ not file-at-end? ]
               [
                 let letto file-read
                 set costo_kwh_consumo fput letto costo_kwh_consumo
               ]
               file-close
        ]
        [;; else non 2010
          ifelse (anno = 2011 and file-exists? "PrezziConsumatore2011.txt" )
          [
            file-open "PrezziConsumatore2011.txt"
               while [ not file-at-end? ]
               [
                 let letto file-read
                 set costo_kwh_consumo fput letto costo_kwh_consumo
               ]
               file-close
          ]
          [;; else non 2011
            ifelse (anno = 2012 and file-exists? "PrezziConsumatore2012.txt" ) 
            [
               file-open "PrezziConsumatore2012.txt"
               while [ not file-at-end? ]
               [
                 let letto file-read
                 set costo_kwh_consumo fput letto costo_kwh_consumo
               ]
               file-close
            ]
            [
              if ( file-exists? "PrezziConsumatore2013.txt" )
              [
                file-open "PrezziConsumatore2013.txt"
                while [ not file-at-end? ]
                [
                  let letto file-read
                  set costo_kwh_consumo fput letto costo_kwh_consumo
                ]
                file-close
              ]
            ]
          ];; fine else non 2011
        ];; fine else non 2010
      ];; fine else non 2009
    ];; fine else non 2008
  ];; fine else non 2007
end

;; procedura per la lettura delle tariffe incentivanti con i diversi Conti Energia
;;2007-2010 2 CE, 2011 2 CE, 2011 3 CE, 2011-2012 4 CE --> tariffa incentivante
;;2012-2013 5 CE --> tariffa onnicomprensiva e incentivante
to calcola_tariffe_ce
  ifelse( ( anno_realizzazione = 2007 or anno_realizzazione = 2008 ) and file-exists? "SecondoCE_inc2007-08.txt" ) 
  [;; 2007-2008
    set tariffa_autoconsumo "Non prevista"
    set  tariffa_omnicomprensiva "Non prevista"
    let count_t 0
    file-open "SecondoCE_inc2007-08.txt"
    while [ not file-at-end? ] 
    [ ;; legge da file finché non trova la tariffa relativa alla fascia di potenza corretta
      let letto file-read
      set count_t count_t + 1
      if (count_t = fascia_potenza )
      [
        set  tariffa_incentivante  letto
      ]          
    ]
    file-close
  ];; fine 2007-2008
  [;; else 2009-2013
    ifelse( anno_realizzazione = 2009 and file-exists? "SecondoCE_inc2009.txt" )
    [;; 2009
      set tariffa_autoconsumo "Non prevista"
      set  tariffa_omnicomprensiva "Non prevista"
      let count_t 0
      file-open "SecondoCE_inc2009.txt"
      while [ not file-at-end? ]
      [ ;; legge da file finché non trova la tariffa relativa alla fascia di potenza corretta
        let letto file-read
        set count_t count_t + 1
        if (count_t = fascia_potenza )
        [
          set  tariffa_incentivante  letto
        ]       
      ]
      file-close
    ];; fine 2009
    [;; 2010-2013
      ifelse( anno_realizzazione = 2010 or ( anno_realizzazione = 2011 and semestre_realizzazione = 1) )
      [;; 2010 e 1 semestre 2011
        ;; nel primo semestre del 2011 coesistono agenti con il Secondo ed il Terzo CE
        ifelse( conto_energia = 2 and file-exists? "SecondoCE_inc2010-11.txt")
        [;; secondo conto energia
           set tariffa_autoconsumo "Non prevista"
           set  tariffa_omnicomprensiva "Non prevista"
           let count_t 0
           file-open "SecondoCE_inc2010-11.txt"
           while [ not file-at-end? ]
           [ ;; legge da file finché non trova la tariffa relativa alla fascia di potenza corretta
             let letto file-read
             set count_t count_t + 1
             if (count_t = fascia_potenza )
             [
               set  tariffa_incentivante  letto
             ]             
           ]
           file-close
        ];; fine secondo conto energia
        [;; terzo conto energia
          if(file-exists? "TerzoCE_inc2011.txt")
          [
             set tariffa_autoconsumo "Non prevista"
             set  tariffa_omnicomprensiva "Non prevista"
             let count_t 0
             file-open "TerzoCE_inc2011.txt"
             while [ not file-at-end? ]
             [ ;; legge da file finché non trova la tariffa relativa alla fascia di potenza corretta
                  let letto file-read
                  set count_t count_t + 1
                  if (count_t = fascia_potenza )
                  [
                    set  tariffa_incentivante  letto
                  ]        
             ]
             file-close
          ]
        ];; fine terzo conto energia
      ];; fine 2010 e 1 semestre 2011
      [;; secondo semestre 2011 e 2012-2013
        ifelse( ( anno_realizzazione = 2011 and semestre_realizzazione = 2) and file-exists? "QuartoCE_inc2011.txt" )
        [;; secondo semestre 2011
          set tariffa_autoconsumo "Non prevista"
          set  tariffa_omnicomprensiva "Non prevista"
          let count_t 0
          file-open "QuartoCE_inc2011.txt"
          while [ not file-at-end? ]
          [ ;; legge da file finché non trova la tariffa relativa alla fascia di potenza corretta
             let letto file-read
             set count_t count_t + 1
             if (count_t = fascia_potenza )
             [
               set  tariffa_incentivante  letto
             ]       
          ]
          file-close
        ];; fine secondo semestre 2011
        [;; 2012-2013
          ifelse( ( anno_realizzazione = 2012 and semestre_realizzazione = 1) and file-exists? "QuartoCE_inc2012.txt" )
          [;; primo semestre 2012
            set tariffa_autoconsumo "Non prevista"
            set  tariffa_omnicomprensiva "Non prevista"
            let count_t 0
            file-open "QuartoCE_inc2012.txt"
            while [ not file-at-end? ]
            [ ;; legge da file finché non trova la tariffa relativa alla fascia di potenza corretta
              let letto file-read
              set count_t count_t + 1
              if (count_t = fascia_potenza )
              [
                set  tariffa_incentivante  letto
              ]       
            ]
            file-close
          ];; fine primo semestre 2012
          [;; secondo semestre 2012 e 2013
            ifelse( ( anno_realizzazione = 2012 and semestre_realizzazione = 2) and file-exists? "QuintoCE_onni2012.txt" and file-exists? "QuintoCE_auto2012.txt" )
            [ ;; secondo semestre 2012
              set  tariffa_incentivante "Non prevista"
              let count_t 0
              file-open "QuintoCE_auto2012.txt"
              while [ not file-at-end? ]
              [ ;; legge da file finché non trova la tariffa relativa alla fascia di potenza corretta
                 let letto file-read
                 set count_t count_t + 1
                 if (count_t = fascia_potenza )
                 [
                   set  tariffa_autoconsumo  letto
                 ]       
              ]
              file-close
              set count_t 0
              file-open "QuintoCE_onni2012.txt"
              while [ not file-at-end? ]
              [ ;; legge da file finché non trova la tariffa relativa alla fascia di potenza corretta
                 let letto file-read
                 set count_t count_t + 1
                 if (count_t = fascia_potenza )
                 [
                   set  tariffa_omnicomprensiva  letto
                 ]         
              ]
              file-close
            ];; fine  secondo semestre 2012
            [ ;; 2013
               if( anno_realizzazione = 2013 and file-exists? "QuintoCE_onni2013.txt" and file-exists? "QuintoCE_auto2013.txt" )
               [
                 set  tariffa_incentivante "Non prevista"
                 let count_t 0
                 file-open "QuintoCE_auto2013.txt"
                 while [ not file-at-end? ]
                 [ ;; legge da file finché non trova la tariffa relativa alla fascia di potenza corretta
                   let letto file-read
                   set count_t count_t + 1
                   if (count_t = fascia_potenza )
                   [
                     set  tariffa_autoconsumo  letto
                   ]       
                 ]
                 file-close
                 set count_t 0
                 file-open "QuintoCE_onni2013.txt"
                 while [ not file-at-end? ]
                 [ ;; legge da file finché non trova la tariffa relativa alla fascia di potenza corretta
                   let letto file-read
                   set count_t count_t + 1
                   if (count_t = fascia_potenza )
                   [
                     set  tariffa_omnicomprensiva  letto
                   ]     
                 ]
                 file-close
               ]
            ] ;; fine 2013
          ];; fine secondo semestre 2012 e 2013
        ];; fine 2012-2013
      ];; fine secondo semestre 2011 e 2012-2013
    ];; fine 2010-2013
  ];; fine else 2009-2013
end


;; >>>>>>>>>>>>>>>> VECCHIA VERSIONE: qui non sono presi in considerazione i Conti Energia <<<<<<<<<<<<<<<<<<<<<<<<<
;; PROCEDURA PER LA LETTURA DELLA TARIFFA RICONOSCIUTA (dati prelevati da file in cartella di lancio)
;se 2012-> tariffa incentivante
;se >2012 tariffa autoconsumo e omnicomprensiva
to calcola_tariffa_gse  
  set anno_realizzazione anno
  set semestre_realizzazione time 
  ifelse (anno_realizzazione = 2012 and file-exists? "Incentivi2012.txt" )
  [
    set tariffa_autoconsumo "Non prevista"
    let count_t 0
    file-open "Incentivi2012.txt"
    while [ not file-at-end? ]
      [
        let letto file-read
        set count_t count_t + 1
        if (count_t = (( semestre_realizzazione - 1 ) * 6 )+ fascia_potenza )
        [
          set  tariffa_incentivante  letto
          if (Varia_Tariffe_Incetivanti )
            [
              set tariffa_incentivante (precision (tariffa_incentivante + (precision( (tariffa_incentivante * %_Variazione_Tariffe) / 100 ) 3) )3)
            ]
        ]
      ]
    file-close
  ]
  [
    ifelse (anno_realizzazione = 2013 and file-exists? "Autoconsumo2013.txt"  and file-exists? "Onnicomprensiva2013.txt" )   
    [
      set  tariffa_incentivante "Non prevista"
      let count_t 0
      file-open "Autoconsumo2013.txt"
      while [ not file-at-end? ]
      [
        let letto file-read
        set count_t count_t + 1
        if (count_t = (( semestre_realizzazione - 1 ) * 6 )+ fascia_potenza )
        [
          set  tariffa_autoconsumo  letto
          if (Varia_Tariffe_Incetivanti )
            [
              set tariffa_autoconsumo (precision (tariffa_autoconsumo + (precision( (tariffa_autoconsumo * %_Variazione_Tariffe) / 100 ) 3))3)
            ]
        ]
      ]
      file-close
      set count_t 0
      file-open "Onnicomprensiva2013.txt"
      while [ not file-at-end? ]
      [
        let letto file-read
        set count_t count_t + 1
        if (count_t = (( semestre_realizzazione - 1 ) * 6 )+ fascia_potenza )
        [
          set  tariffa_omnicomprensiva  letto
          if (Varia_Tariffe_Incetivanti )
            [
              set tariffa_omnicomprensiva (precision (tariffa_omnicomprensiva + (precision( (tariffa_omnicomprensiva * %_Variazione_Tariffe) / 100 ) 3))3)
            ]
        ]
      ] 
      file-close      
    ]
    [
      ifelse (anno_realizzazione = 2014 and file-exists? "Autoconsumo2014.txt"  and file-exists? "Onnicomprensiva2014.txt" )   
      [
        set  tariffa_incentivante "Non prevista"
        let count_t 0
        file-open "Autoconsumo2014.txt"
        while [ not file-at-end? ]
        [
          let letto file-read
          set count_t count_t + 1
          if (count_t = (( semestre_realizzazione - 1 ) * 6 )+ fascia_potenza )
          [
            set  tariffa_autoconsumo  letto
            if (Varia_Tariffe_Incetivanti )
              [
                set tariffa_autoconsumo (precision (tariffa_autoconsumo + (precision( (tariffa_autoconsumo * %_Variazione_Tariffe) / 100 ) 3))3)
              ]
          ]
        ]
        file-close
        set count_t 0
        file-open "Onnicomprensiva2014.txt"
        while [ not file-at-end? ]
        [
          let letto file-read
          set count_t count_t + 1
          if (count_t = (( semestre_realizzazione - 1 ) * 6 )+ fascia_potenza )
          [
            set  tariffa_omnicomprensiva letto
            if (Varia_Tariffe_Incetivanti )
              [
                set tariffa_omnicomprensiva (precision (tariffa_omnicomprensiva + (precision( (tariffa_omnicomprensiva * %_Variazione_Tariffe) / 100 ) 3))3)
              ]
          ]
        ] 
        file-close
      ]
      [
        ifelse (anno_realizzazione = 2015 and file-exists? "Autoconsumo2015.txt"  and file-exists? "Onnicomprensiva2015.txt" )   
        [
          set  tariffa_incentivante "Non prevista"
          let count_t 0
          file-open "Autoconsumo2015.txt"
          while [ not file-at-end? ]
          [
            let letto file-read
            set count_t count_t + 1
            if (count_t = (( semestre_realizzazione - 1 ) * 6 )+ fascia_potenza )
            [
              set  tariffa_autoconsumo  letto
              if (Varia_Tariffe_Incetivanti )
                [
                  set tariffa_autoconsumo (precision (tariffa_autoconsumo + (precision( (tariffa_autoconsumo * %_Variazione_Tariffe) / 100 ) 3))3)
                ]
            ]
          ]
          file-close
          set count_t 0
          file-open "Onnicomprensiva2015.txt"
          while [ not file-at-end? ]
          [
            let letto file-read
            set count_t count_t + 1
            if (count_t = (( semestre_realizzazione - 1 ) * 6 )+ fascia_potenza )
            [
              set  tariffa_omnicomprensiva letto
              if (Varia_Tariffe_Incetivanti )
                [
                  set tariffa_omnicomprensiva (precision (tariffa_omnicomprensiva + (precision( (tariffa_omnicomprensiva * %_Variazione_Tariffe) / 100 ) 3))3)
                ]
            ]
          ] 
          file-close
        ]
        [
          set  tariffa_incentivante "Non prevista"
          let count_t 0
          file-open "Autoconsumo2016.txt"
          while [ not file-at-end? ]
          [
            let letto file-read
            set count_t count_t + 1
            if (count_t = (( semestre_realizzazione - 1 ) * 6 )+ fascia_potenza )
            [
              set  tariffa_autoconsumo  letto
              if (Varia_Tariffe_Incetivanti )
                [
                  set tariffa_autoconsumo (precision (tariffa_autoconsumo + (precision( (tariffa_autoconsumo * %_Variazione_Tariffe) / 100 ) 3))3)
                ]
            ]
          ]
          file-close
          set count_t 0
          file-open "Onnicomprensiva2016.txt"
          while [ not file-at-end? ]
          [
            
            let letto file-read
            set count_t count_t + 1
            if (count_t = (( semestre_realizzazione - 1 ) * 6 )+ fascia_potenza )
            [
              set  tariffa_omnicomprensiva letto
              if (Varia_Tariffe_Incetivanti )
                [
                  set tariffa_omnicomprensiva (precision (tariffa_omnicomprensiva + (precision( (tariffa_omnicomprensiva * %_Variazione_Tariffe) / 100 ) 3))3)
                ]
            ]
          ] 
          file-close
        ]
      ]
    ]
  ]
end


;; PROCEDURA CHE AGGIORNA A RUN TIME I PREZZI DELL'ENERGIA E I PREZZI GARANTITI GSE
to aggiorna_prezzi
  ;; nella versione con CE questi prezzi dell'energia non sono usati e quindi è inutile aggiornarli --> vengono usate serie storiche
;  set costo_kwh_fascia1  precision   (costo_kwh_fascia1 + ( (costo_kwh_fascia1  *  variazione_annuale_prezzi_elettricita ) / 100 ) ) 3
;  set costo_kwh_fascia2  precision (costo_kwh_fascia2 +   ( (costo_kwh_fascia2  *  variazione_annuale_prezzi_elettricita ) / 100 ) ) 3
;  set costo_kwh_fascia3  precision (costo_kwh_fascia3 + ( (costo_kwh_fascia3  *  variazione_annuale_prezzi_elettricita ) / 100) ) 3
;  set costo_kwh_fascia4 precision (costo_kwh_fascia4 + ( (costo_kwh_fascia4  *  variazione_annuale_prezzi_elettricita ) / 100) ) 3
;  set costo_kwh_fascia5 precision (costo_kwh_fascia5 + ( (costo_kwh_fascia5  *  variazione_annuale_prezzi_elettricita )  / 100) )3
  
  ;; nella versione con CE questi prezzi minimi gse non sono usati e quindi è inutile aggiornarli --> vengono usate serie storiche
;  set prezzi_minimi_gsef1 precision  ( prezzi_minimi_gsef1 +  ( (prezzi_minimi_gsef1  *  variazione_annuale_prezzi_elettricita )  / 100 ) ) 3
;  set prezzi_minimi_gsef2 precision  (prezzi_minimi_gsef2 +  ( (prezzi_minimi_gsef2  *  variazione_annuale_prezzi_elettricita )  / 100 ) )3
;  set prezzi_minimi_gsef3 precision  (prezzi_minimi_gsef3 +  ( (prezzi_minimi_gsef3  *  variazione_annuale_prezzi_elettricita )  / 100 ) ) 3
  
  set Costo_Medio_kwP (Costo_Medio_kwP  -  round ( (Costo_Medio_kwP * Riduzione_anno_%costo_pannello ) / 100) )
  
end

;; AGGIORNAMENTO DATI IMPIANTO    
to aggiorna_impianti
  ask pf 
  [
    set vita_impianto (anno + time ) - ( anno_realizzazione  + semestre_realizzazione )
    if (vita_impianto = 21)
    [
      set Data_termine_incentivi  (word time " Semestre del " anno )
      calcola_roi_roe
    ] 
  ]
end

;; PROCEDURA CHE AGGIORNA A RUN TIME I CONSUMI DELL'AGENTE E LA PRODUZIONE DELL'IMPIANTO
to aggiorna_consumi
  ask pf with [ semestre_realizzazione = time and ( vita_impianto < anno and vita_impianto <= 20 ) ]
  [
    set consumo_medio_annuale round ( consumo_medio_annuale  +  (( consumo_medio_annuale * Aumento_%annuo_consumi ) / 100) );aumeta
    set kw_annui_impianto round ( kw_annui_impianto - (( kw_annui_impianto * Perdita_efficienza_annuale_pannello ) / 100 ) );cala
    ifelse ( consumo_medio_annuale <= kw_annui_impianto )
    [
      set kw_autoconsumo consumo_medio_annuale
      set kw_immessi  kw_annui_impianto - consumo_medio_annuale
      set kw_prelevati  0
    ]
    [
      set kw_autoconsumo   kw_annui_impianto
      set kw_immessi  0
      set kw_prelevati  consumo_medio_annuale - kw_annui_impianto 
    ]
  ]
end

;; PROCEDURA ORGANIZZA AGGIORNAMENTEO RICAVI
to aggiorna_ricavi
  ask pf
  [
    ;pago la regione
    if fr ="Rotazione" and ratepagate < Anni_Restituzione_mutuo_regione and  freg = true
    [
      set BudgetCorrente  BudgetCorrente + rataReg;restituisco soldi alla regione
      set ratepagate ratepagate + 1
    ]   
    if fr ="Garanzia" and ratepagate < Anni_Restituzione_mutuo_banca and  freg = true
    [    
      set ratepagate ratepagate + 1
    ]    
  ]  
  ask pf with [ semestre_realizzazione = time and ( vita_impianto >= 1 and vita_impianto <= 20 ) ];una volta all'anno per 20 anni
  [
    calcola_ricavi_da_autoconsumo;cosa ho risparmiato producendo da me l'energia
    calcola_costi_energia_prelevata
    
    ;; ricavi calcolati senza i CE, vecchia versione
    ;; ifelse ( anno_realizzazione = 2012 )
    ;; [
    ;;   calcola_ricavi_impianti_2012
    ;; ]
    ;; [
    ;;  calcola_ricavi_impianti_non2012 vecchio nome della funzione, prima di estensione con CE
    ;; ]
    
    ifelse( conto_energia = 2 or conto_energia = 3 or conto_energia = 4)
    [;; Secondo, Terzo e Quarto Conto Energia
      calcola_ricavi_impianti_CE_2_3_4
    ]
    [;; Quinto Conto ENergia
      calcola_ricavi_impianti_CE_5
    ]
    
    calcola_flusso_di_cassa
  ]
end

;; CALCLO DEI FLUSSI DI CASSA ATTUALIZZATI E COMULATI, E DEL VALORE ATTUALE NETTO DELL'IMPIANTO
to calcola_flusso_di_cassa
  let ric_incentivo last ricavi_incentivi
  let ric_autoconsumo last ricavi_autoconsumo
  let rata rata_annuale_prestito + rataReg + rataBanca;rata prestito, e mutui se presenti  
  ;show word rataReg word "  "  rataBanca;  
  let ric_vendita last ricavi_vendita
  let costi_annuali precision ((costo_impianto * Manutenzione_anno_%costo_totale)  / 100 ) 2
  let flusso_c precision ( (ric_incentivo + ric_autoconsumo + ric_vendita ) - (rata + costi_annuali) ) 2
  set flusso_cassa lput flusso_c flusso_cassa
  set flusso_cassa_cumulato precision (flusso_cassa_cumulato + flusso_c ) 2
  let flusso_c_attualizzato precision (flusso_c / (1 + ( WACC / 100 ) ) ^ vita_impianto ) 2
  set flusso_cassa_attualizzato lput flusso_c_attualizzato flusso_cassa_attualizzato
  set flusso_cassa_attualizzato_cumulato precision ( flusso_cassa_attualizzato_cumulato + flusso_c_attualizzato ) 2
  let van_ora precision ((- costo_impianto ) + flusso_cassa_attualizzato_cumulato) 2
  ;;calcolo pay back time
  if (vita_impianto > 1 )
    [
      let van_prec last van
      if(van_prec < 0 and van_ora > 0 )
      [
        set PBT vita_impianto
      ]
    ]
  set van lput van_ora van
end

;; >>>>>>>>>>>>>>>> VECCHIA VERSIONE: qui non sono presi in considerazione i Conti Energia e sfrutta i prezzi minimi del gse nel 2011<<<<<<<<<<<<<<<<<<<<<<<<<
;; PROCEDURA DI INDIVIDUAZIONE DEI RICAVI PER GLI IMPIANTI INSTALLATI DOPO IL 2012
to calcola_ricavi_impianti_2012
  let ricavo_incentivo precision ( kw_annui_impianto *  tariffa_incentivante ) 2
  set ricavi_incentivi lput ricavo_incentivo ricavi_incentivi
  if ( fascia_potenza  <= 6 )
  [
    ifelse ( kw_immessi < 500000 )
      [
        let ricavo_vendita precision ( kw_immessi * prezzi_minimi_gsef1 ) 2
        set ricavi_vendita lput ricavo_vendita ricavi_vendita
      ]
      [
        ifelse ( kw_immessi >= 500000 and kw_immessi < 1000000 )
        [
          let ricavo_vendita precision ( kw_immessi * prezzi_minimi_gsef2 ) 2
          set ricavi_vendita lput ricavo_vendita ricavi_vendita
        ]
        [
          let ricavo_vendita precision ( kw_immessi * prezzi_minimi_gsef3 ) 2
          set ricavi_vendita lput ricavo_vendita ricavi_vendita
        ]
      ]
  ]
  ;; da definire ricavi vendita per impianti grandi per il momento ho messo <= 6 ma dovrevve essere di 4 IN QUANTO
  ;; I GRANDI IMPIANTI DEVONO SE NON EFFETTUARE UNA TIPOLOGIA DI RIVENDITA DI TIPO DIRETTO V.TESI
end


;; procedura per il calcolo dei ricavi degli impianti con Secondo, Terzo e Quarto CE
;; per ora il modello simulato prevede il Ritiro Dedicato per tutti i Conti Energia e classi di potenza/impianti
to calcola_ricavi_impianti_CE_2_3_4
  let ricavo_incentivo precision ( kw_annui_impianto *  tariffa_incentivante ) 2
  set ricavi_incentivi lput ricavo_incentivo ricavi_incentivi
  ;; ritiro dedicato --> gestione kw immessi
  if ( fascia_potenza  <= 6 )
  [ ;; per ora vale per gli impianti di qualsiasi potenza..
    let prezzi_minimi_gse_temp 0
    ifelse ( kw_immessi < 500000 )
      [
        set prezzi_minimi_gse_temp item 2 prezzi_minimi_gse
      ]
      [
        ifelse ( kw_immessi >= 500000 and kw_immessi < 1000000 )
        [
          set prezzi_minimi_gse_temp item 1 prezzi_minimi_gse
        ]
        [
          set prezzi_minimi_gse_temp item 0 prezzi_minimi_gse
        ]
      ]
      let ricavo_vendita precision ( kw_immessi * prezzi_minimi_gse_temp ) 2
      set ricavi_vendita lput ricavo_vendita ricavi_vendita
  ]
  ;; vedi procedura calcola_ricavi_impianti_2012 --> per gli impianti di classe 6 non si applica il Ritiro Dedicato ma dovrebbero essere implementati meccanismi diretti
end

;; >>>>>>>>>>>>>>>> VECCHIA VERSIONE: va bene anche nel simulatore con CE, a patto di tenere conto del fatto che calcola i ricavi a partire dal secondo semestre 2012<<<<<<<<<<<<<<<<<<<<<<<
;; procedura per il calcolo dei ricavi degli impianti con Quinto CE
to calcola_ricavi_impianti_CE_5
  let ricavo_incentivo precision ( kw_autoconsumo * tariffa_autoconsumo ) 2
  set ricavi_incentivi lput ricavo_incentivo ricavi_incentivi
  let ricavo_vendita precision ( kw_immessi * tariffa_omnicomprensiva ) 2
  set ricavi_vendita lput ricavo_vendita ricavi_vendita
end

;; INDIVIDUAZIONE RICAVI IMPLICITI DA AUTOCONSUMO in base alla fascia di consumo e quindi in relazione allo specifico prezzo praticato e attualizzato
to calcola_ricavi_da_autoconsumo
  ifelse ( consumo_medio_annuale  < 1000 )
    [
      ;; vecchia versione Croce
      ;; let ricavo_autoconsumo   precision ( kw_autoconsumo * costo_kwh_fascia1 ) 2
      let ricavo_autoconsumo   precision ( kw_autoconsumo * ( item 4 costo_kwh_consumo ) ) 2
      set ricavi_autoconsumo lput ricavo_autoconsumo ricavi_autoconsumo      
    ]
    [
      ifelse ( consumo_medio_annuale  >= 1000 and consumo_medio_annuale < 2500 )
        [
          ;; vecchia versione Croce
          ;; let ricavo_autoconsumo   precision  ( kw_autoconsumo * costo_kwh_fascia2 ) 2 
          let ricavo_autoconsumo   precision ( kw_autoconsumo * ( item 3 costo_kwh_consumo ) ) 2
          set ricavi_autoconsumo lput ricavo_autoconsumo ricavi_autoconsumo 
        ]
        [
          ifelse ( consumo_medio_annuale >= 2500 and consumo_medio_annuale < 5000 )
          [
            ;; vecchia versione Croce
            ;; let ricavo_autoconsumo  precision  ( kw_autoconsumo * costo_kwh_fascia3 ) 2
            let ricavo_autoconsumo   precision ( kw_autoconsumo * ( item 2 costo_kwh_consumo ) ) 2
            set ricavi_autoconsumo lput ricavo_autoconsumo ricavi_autoconsumo    
          ]
          [
            ifelse ( consumo_medio_annuale >= 5000 and consumo_medio_annuale < 15000 )
            [
              ;; vecchia versione Croce
              ;; let ricavo_autoconsumo  precision  ( kw_autoconsumo * costo_kwh_fascia4 ) 2
              let ricavo_autoconsumo   precision ( kw_autoconsumo * ( item 1 costo_kwh_consumo ) ) 2
              set ricavi_autoconsumo lput ricavo_autoconsumo ricavi_autoconsumo  
            ]
            
            [
              ;; vecchia versione Croce
              ;; let ricavo_autoconsumo precision (  kw_autoconsumo * costo_kwh_fascia5 ) 2 
              let ricavo_autoconsumo   precision ( kw_autoconsumo * ( item 0 costo_kwh_consumo ) ) 2
              set ricavi_autoconsumo lput ricavo_autoconsumo ricavi_autoconsumo
              
            ]
          ]
          
        ]
    ]
end

;; CALCOLO DEI COSTI SOSTENUTO PER L'ENERGIA EVENTUALMENTE PRELEVATA
to calcola_costi_energia_prelevata
  ifelse ( kw_prelevati   < 1000 )
    [
      ;; vecchia versione Croce
      ;; let costo_energia_prelevata   precision ( kw_prelevati  * costo_kwh_fascia1 ) 2
      let costo_energia_prelevata   precision ( kw_prelevati * ( item 4 costo_kwh_consumo ) ) 2
      set costi_energia_prelevata lput costo_energia_prelevata costi_energia_prelevata
      set costi_tot_energia_prelevata precision (costi_tot_energia_prelevata + costo_energia_prelevata ) 2   
    ]
    [
      ifelse ( kw_prelevati >= 1000 and kw_prelevati < 2500 )
        [
          ;; vecchia versione Croce
          ;; let costo_energia_prelevata   precision  ( kw_prelevati * costo_kwh_fascia2 ) 2 
          let costo_energia_prelevata   precision ( kw_prelevati * ( item 3 costo_kwh_consumo ) ) 2
          set costi_energia_prelevata lput costo_energia_prelevata costi_energia_prelevata
          set costi_tot_energia_prelevata precision (costi_tot_energia_prelevata + costo_energia_prelevata ) 2 
        ]
        [
          ifelse ( kw_prelevati >= 2500 and kw_prelevati < 5000 )
          [
            ;; vecchia versione Croce
            ;; let costo_energia_prelevata  precision  (kw_prelevati * costo_kwh_fascia3 ) 2
            let costo_energia_prelevata   precision ( kw_prelevati * ( item 2 costo_kwh_consumo ) ) 2
            set costi_energia_prelevata lput costo_energia_prelevata costi_energia_prelevata
            set costi_tot_energia_prelevata precision (costi_tot_energia_prelevata + costo_energia_prelevata ) 2 
          ]
          [
            ifelse ( kw_prelevati >= 5000 and kw_prelevati < 15000 )
            [
              ;; vecchia versione Croce
              ;; let costo_energia_prelevata  precision  (kw_prelevati * costo_kwh_fascia4 ) 2
              let costo_energia_prelevata   precision ( kw_prelevati * ( item 1 costo_kwh_consumo ) ) 2
              set costi_energia_prelevata lput costo_energia_prelevata costi_energia_prelevata
              set costi_tot_energia_prelevata precision (costi_tot_energia_prelevata + costo_energia_prelevata ) 2 
            ]
            [
              ;; vecchia versione Croce
              ;; let costo_energia_prelevata precision (  kw_prelevati * costo_kwh_fascia5 ) 2 
              let costo_energia_prelevata   precision ( kw_prelevati * ( item 0 costo_kwh_consumo ) ) 2
              set costi_energia_prelevata lput costo_energia_prelevata costi_energia_prelevata
              set costi_tot_energia_prelevata precision (costi_tot_energia_prelevata + costo_energia_prelevata ) 2 
            ]
          ]
          
        ]
    ]
end

;; PROCEDURA PER INDIVIDUARE IL COSTO TOTALE DELL'INVESTIMENTO valutando eventualmente anche se Esistono incentivi sull'installazione ps. tiene conto di fattori di scala 
to calcola_costi_impianto  
  ifelse (dimensione_impianto <= 10000);10kw
    [
      ;; costo_impianto con pontenza inferiore a 10kw
      set costo_impianto round    ((kw_annui_impianto / Irradiazione_media_annua_kwh_kwp) * Costo_Medio_kwP)     
      ;; compreso di iva (costo impianto  x ( 1,1) ovvero 1  + iva al 10 % 
    ]
    [
      set costo_impianto round  ( ((kw_annui_impianto / Irradiazione_media_annua_kwh_kwp) * Costo_Medio_kwP ) * 0.9 )
    ]
  set costo_impianto round ( costo_impianto * 1.1 )  ;;iva
  if(Incentivi_Installazione)
    [
      set incentivo_installazione round ((costo_impianto * %_Incentivi_Installazione) / 100) 
      set costo_impianto costo_impianto - incentivo_installazione
    ]
  ask pf with [id = 0]
    [set_y_range_plot_PBT]
end  

;; STIMA DEL ROE DELL'INVESTIMENTO
to stima_roe
  ;; l'unico dato che occorre stimare è il flusso_cassa_cumulato, gli altri sono ricavati dai parametri dell'agente (vedi crea-pf e genera_pf e funzioni varie)
  set stima_flusso_cassa_cumulato 0
  set stima_flusso_cassa_attualizzato_cumulato 0
  set stima_consumo_medio_annuale consumo_medio_annuale ;; parametro selezionabile da interfaccia 
  set stima_kw_autoconsumo 0
  set stima_kw_annui_impianto kw_annui_impianto ;; calcolato dalla procedura calcola_dimensione, invocata precedentemente in genera_pf
  set stima_kw_immessi 0
  set stima_kw_prelevati  0
  set stima_ric_incentivo 0
  set stima_ric_autoconsumo 0
  let rata rata_annuale_prestito + rataReg + rataBanca;rata prestito, e mutui se presenti  
  set stima_ric_vendita 0
  let costi_annuali precision ((costo_impianto * Manutenzione_anno_%costo_totale)  / 100 ) 2
  let indice_vita_impianto 1
  
  ;; valori di default mantenuti costanti per tutta la vita dell'impanto --> per maggiore precisione dovrebbero essere aggiornati annualmente
  ;; vecchia versione senza CE
  ;; let stima_prezzi_minimi_gsef1 0.103 
  ;; let stima_prezzi_minimi_gsef2 0.086
  ;; let stima_prezzi_minimi_gsef3 0.076
  ;; prezzi minimi con CE sono presi da serie storiche e memorizzati nella lista corretta anno dopo anno --> il roe calcolato a runtime prende in considerazione tale lista e 
  ;; quindi ne osserva le modifiche fatte annualmente, la stima del roe legge i prezzi minimi una volta sola e basa i suoi calcoli su un solo valore
  let stima_prezzi_minimi_gsef1 item 2 prezzi_minimi_gse
  let stima_prezzi_minimi_gsef2 item 1 prezzi_minimi_gse
  let stima_prezzi_minimi_gsef3 item 0 prezzi_minimi_gse
  
  ;; versione vecchia con i prezzi presi da interfaccia e poi aggiornati annualmente
;  let stima_costo_kwh_fascia1 costo_kwh_fascia1
;  let stima_costo_kwh_fascia2 costo_kwh_fascia2
;  let stima_costo_kwh_fascia3 costo_kwh_fascia3
;  let stima_costo_kwh_fascia4 costo_kwh_fascia4
;  let stima_costo_kwh_fascia5 costo_kwh_fascia5
  ;; versione con i prezzi dell'energia presi da serie storiche 
  let stima_costo_kwh_fascia1 item 4 costo_kwh_consumo
  let stima_costo_kwh_fascia2 item 3 costo_kwh_consumo
  let stima_costo_kwh_fascia3 item 2 costo_kwh_consumo
  let stima_costo_kwh_fascia4 item 1 costo_kwh_consumo
  let stima_costo_kwh_fascia5 item 0 costo_kwh_consumo
    
  ;;questo ciclo calcola i ricavi e i flussi di cassa stimati per i 20 anni di vita degli impianti
  repeat 20 [
 
     ;; aggiorna le stime dei consumi annuali e dei kw annui
    set stima_consumo_medio_annuale round ( stima_consumo_medio_annuale  +  (( stima_consumo_medio_annuale * Aumento_%annuo_consumi ) / 100) );aumeta
    set stima_kw_annui_impianto round ( stima_kw_annui_impianto - (( stima_kw_annui_impianto * Perdita_efficienza_annuale_pannello ) / 100 ) );cala
    ifelse ( stima_consumo_medio_annuale <= stima_kw_annui_impianto )
    [
      set stima_kw_autoconsumo stima_consumo_medio_annuale
      set stima_kw_immessi  stima_kw_annui_impianto - stima_consumo_medio_annuale
      set stima_kw_prelevati  0
    ]
    [
      set stima_kw_autoconsumo   stima_kw_annui_impianto
      set stima_kw_immessi  0
      set stima_kw_prelevati  stima_consumo_medio_annuale - stima_kw_annui_impianto 
    ] ;; fine aggiornamento delle stime dei consumi annuali e dei kw annui
    
    ;; output-print ( word "----->>>> DEBUG -- indice_vita_impianto: " indice_vita_impianto " stima_consumo_medio_annuale: " stima_consumo_medio_annuale " stima_kw_annui_impianto " stima_kw_annui_impianto)
    ;; output-print ( word "----->>>> DEBUG -- stima_kw_autoconsumo: " stima_kw_autoconsumo " stima_kw_immessi: " stima_kw_immessi " stima_kw_prelevati " stima_kw_prelevati)
    ;; output-print ( word "----->>>> DEBUG -- Aumento_%annuo_consumi: " Aumento_%annuo_consumi " Perdita_efficienza_annuale_pannello: " Perdita_efficienza_annuale_pannello)
    
    ;; stima i ricavi da autoconsumo
    ifelse ( stima_consumo_medio_annuale < 1000 )[ set stima_ric_autoconsumo precision ( stima_kw_autoconsumo * stima_costo_kwh_fascia1 ) 2 ][
    ifelse ( stima_consumo_medio_annuale >= 1000 and stima_consumo_medio_annuale < 2500 )[ set stima_ric_autoconsumo precision ( stima_kw_autoconsumo * stima_costo_kwh_fascia2 ) 2 ][
    ifelse ( stima_consumo_medio_annuale >= 2500 and stima_consumo_medio_annuale < 5000 )[ set stima_ric_autoconsumo precision ( stima_kw_autoconsumo * stima_costo_kwh_fascia3 ) 2 ][
    ifelse ( stima_consumo_medio_annuale >= 5000 and stima_consumo_medio_annuale < 15000 )[ set stima_ric_autoconsumo precision ( stima_kw_autoconsumo * stima_costo_kwh_fascia4 ) 2 ][
      set stima_ric_autoconsumo precision (  stima_kw_autoconsumo * stima_costo_kwh_fascia5 ) 2 
    ]]]] ;; fine stima ricavi autoconsumo
    
    ;; output-print ( word "----->>>> DEBUG -- indice_vita_impianto: " indice_vita_impianto " stima_ric_autoconsumo: " stima_ric_autoconsumo)
    ;; output-print ( word "----->>>> DEBUG -- costo_kwh_fascia1: " costo_kwh_fascia1 " costo_kwh_fascia2: " costo_kwh_fascia2 " costo_kwh_fascia3 " costo_kwh_fascia3)
    
    
    ;; ----------------------------------- stima ricavi impianti vecchia versione senza CE --------------------------------------
    ;; calcola stima ricavi impianti
    ;; ifelse ( anno_realizzazione = 2012 ) ;; impianti 2012
    ;; [
    ;;   set stima_ric_incentivo precision ( stima_kw_annui_impianto *  tariffa_incentivante ) 2
    ;;   if ( fascia_potenza  <= 6 )
    ;;   [
    ;;     ifelse ( stima_kw_immessi < 500000 )
    ;;     [
    ;;       set stima_ric_vendita precision ( stima_kw_immessi * stima_prezzi_minimi_gsef1 ) 2
    ;;     ]
    ;;     [
    ;;       ifelse ( stima_kw_immessi >= 500000 and stima_kw_immessi < 1000000 )
    ;;       [
    ;;         set stima_ric_vendita precision ( stima_kw_immessi * stima_prezzi_minimi_gsef2 ) 2
    ;;       ]
    ;;       [
    ;;         set stima_ric_vendita precision ( stima_kw_immessi * stima_prezzi_minimi_gsef3 ) 2
    ;;       ]
    ;;     ]
    ;;   ]
    ;; ] ;; fine impianti 2012
    ;; [ ;; impianti non 2012
    ;;   set stima_ric_incentivo precision ( stima_kw_autoconsumo * tariffa_autoconsumo ) 2
    ;;   set stima_ric_vendita precision ( stima_kw_immessi * tariffa_omnicomprensiva ) 2
    ;;   ;; fine impianti non 2012
    ;; ];; fine calcola ricavi impianti
    ;; ----------------------------------- fine stima ricavi impianti vecchia versione senza CE --------------------------------------
    
    
    ;; ----------------------------------- stima ricavi impianti nuova versione con CE --------------------------------------
    
    ifelse( conto_energia = 2 or conto_energia = 3 or conto_energia = 4)[
      ;; ricavi impianti con CE 2-3-4
      set stima_ric_incentivo precision ( stima_kw_annui_impianto *  tariffa_incentivante ) 2
      if ( fascia_potenza  <= 6 )
      [ 
        ifelse ( stima_kw_immessi < 500000 ) [ set stima_ric_vendita precision ( stima_kw_immessi * stima_prezzi_minimi_gsef1 ) 2 ][
          ifelse ( stima_kw_immessi >= 500000 and stima_kw_immessi < 1000000 ) [ set stima_ric_vendita precision ( stima_kw_immessi * stima_prezzi_minimi_gsef2 ) 2 ][
            set stima_ric_vendita precision ( stima_kw_immessi * stima_prezzi_minimi_gsef3 ) 2 
          ]]
      ]
    ]
    [ ;; ricavi impianti con CE 5
      set stima_ric_incentivo precision ( stima_kw_autoconsumo * tariffa_autoconsumo ) 2
      set stima_ric_vendita precision ( stima_kw_immessi * tariffa_omnicomprensiva ) 2
      
    ]
    
    
    ;; ----------------------------------- fine stima ricavi impianti nuova versione con CE --------------------------------------
    
    ;; output-print ( word "----->>>> DEBUG -- indice_vita_impianto: " indice_vita_impianto " stima_ric_incentivo: " stima_ric_incentivo " stima_ric_vendita: " stima_ric_vendita)
    ;; output-print ( word "----->>>> DEBUG -- stima_kw_immessi: " stima_kw_immessi " prezzi_minimi_gsef1: " prezzi_minimi_gsef1)
    ;; output-print ( word "----->>>> DEBUG -- tariffa_incentivante: " tariffa_incentivante " tariffa_autoconsumo: " tariffa_autoconsumo " tariffa_omnicomprensiva " tariffa_omnicomprensiva)
    
    ;; stima dei flussi di cassa 
    let flusso_c precision ( (stima_ric_incentivo + stima_ric_autoconsumo + stima_ric_vendita ) - (rata + costi_annuali) ) 2
    set stima_flusso_cassa_cumulato precision (stima_flusso_cassa_cumulato + flusso_c ) 2
    let flusso_c_attualizzato precision (flusso_c / (1 + ( WACC / 100 ) ) ^ indice_vita_impianto ) 2
    set stima_flusso_cassa_attualizzato_cumulato precision ( stima_flusso_cassa_attualizzato_cumulato + flusso_c_attualizzato ) 2
    
    ;; output-print ( word "----->>>> DEBUG -- indice_vita_impianto: " indice_vita_impianto " flusso_c_attualizzato: " flusso_c_attualizzato " flusso_c " flusso_c)
    ;; output-print ( word "----->>>> DEBUG -- stima_ric_incentivo: " stima_ric_incentivo " stima_ric_autoconsumo: " stima_ric_autoconsumo " stima_ric_vendita " stima_ric_vendita)
    ;; output-print ( word "----->>>> DEBUG -- rata: " rata " costi_annuali: " costi_annuali)
    
    ;; simulo il passare degli anni con un indice
    set indice_vita_impianto  indice_vita_impianto + 1
    
    ;; a fine anno i prezzi stimati vengono aggiornati
    ;; la stima viene aggiornata considerando una variazione annuale dei prezzi dell'elettricita fissa e imposta come parametro --> in realtà essa varia annualmene e quindi 
    ;; le stime del roe potrebbero differire (in modo significativo? controllare) dal roe effettivamente calcolato
    set stima_costo_kwh_fascia1  precision   (stima_costo_kwh_fascia1 + ( (stima_costo_kwh_fascia1  *  variazione_annuale_prezzi_elettricita ) / 100 ) ) 3
    set stima_costo_kwh_fascia2  precision (stima_costo_kwh_fascia2 +   ( (stima_costo_kwh_fascia2  *  variazione_annuale_prezzi_elettricita ) / 100 ) ) 3
    set stima_costo_kwh_fascia3  precision (stima_costo_kwh_fascia3 + ( (stima_costo_kwh_fascia3  *  variazione_annuale_prezzi_elettricita ) / 100) ) 3
    set stima_costo_kwh_fascia4 precision (stima_costo_kwh_fascia4 + ( (stima_costo_kwh_fascia4  *  variazione_annuale_prezzi_elettricita ) / 100) ) 3
    set stima_costo_kwh_fascia5 precision (stima_costo_kwh_fascia5 + ( (stima_costo_kwh_fascia5  *  variazione_annuale_prezzi_elettricita )  / 100) )3
    set stima_prezzi_minimi_gsef1 precision  ( stima_prezzi_minimi_gsef1 +  ( (stima_prezzi_minimi_gsef1  *  variazione_annuale_prezzi_elettricita )  / 100 ) ) 3
    set stima_prezzi_minimi_gsef2 precision  (stima_prezzi_minimi_gsef2 +  ( (stima_prezzi_minimi_gsef2  *  variazione_annuale_prezzi_elettricita )  / 100 ) )3
    set stima_prezzi_minimi_gsef3 precision  (stima_prezzi_minimi_gsef3 +  ( (stima_prezzi_minimi_gsef3  *  variazione_annuale_prezzi_elettricita )  / 100 ) ) 3
    
  ] ;; fine ciclo repeat
  
  ;; stima del VAN alla fine del periodo di vita dell'impianto
  set stima_van precision ((- costo_impianto ) + stima_flusso_cassa_attualizzato_cumulato) 2
  
  ;; output-print ( word "----->>>> DEBUG -- stima_flusso_cassa_cumulato: " stima_flusso_cassa_cumulato)
  ;; output-print ( word "----->>>> DEBUG -- stima_flusso_cassa_attualizzato_cumulato: " stima_flusso_cassa_attualizzato_cumulato)
    
  set roe_stimato precision ((((stima_flusso_cassa_attualizzato_cumulato - ((costo_impianto - ifin + intRegione) - importo_prestito )) / ( (costo_impianto - ifin + intRegione + 0.01 ) - importo_prestito) ) * 100 ) / durata_impianti ) 3
  
  output-print  (word   "----->>>> AGENTE " id  " ANNO " anno_realizzazione " SEMESTRE " semestre_realizzazione " CE " conto_energia " roe stimato: " roe_stimato) 
end

;; CALCOLO INDICI ROE E ROI
to calcola_roi_roe
  ;; TODO -----> cosa è corretto usare (costo_impianto - ifin + intRegione) oppure (costo_impianto + intRegione)? 
 ; (costo_impianto - ifin + intRegione)  
 
 ;; Croce utilizza nel calcolo di roi e roeil flusso cassa cumulato NON attualizzato
;  set roi% precision ((((flusso_cassa_cumulato - ((costo_impianto - ifin + intRegione) - importo_prestito ))  / ( costo_impianto - ifin + intRegione + 0.01 ) ) * 100 ) / durata_impianti )  3
;  ;; set roe% precision ((((flusso_cassa_cumulato - ((costo_impianto - ifin + intRegione) - importo_prestito )) / ( (costo_impianto - ifin + intRegione + 0.01 ) - importo_prestito) ) * 100 ) / durata_impianti ) 3
;  set roe% precision ((((flusso_cassa_cumulato - ((costo_impianto + intRegione) - importo_prestito )) / ( (costo_impianto + intRegione + 0.01 ) - importo_prestito) ) * 100 ) / durata_impianti ) 3

  ;; versione per il calcolo di roi e roe con il flusso di cassa cumulato e attualizzato
  set roi% precision ((((flusso_cassa_attualizzato_cumulato - ((costo_impianto - ifin + intRegione) - importo_prestito ))  / ( costo_impianto - ifin + intRegione + 0.01 ) ) * 100 ) / durata_impianti )  3
  set roe% precision ((((flusso_cassa_attualizzato_cumulato - ((costo_impianto - ifin + intRegione) - importo_prestito )) / ( (costo_impianto - ifin + intRegione + 0.01 ) - importo_prestito) ) * 100 ) / durata_impianti ) 3
 ;; output-print  (word   "----->>>> AGENTE " id  " ANNO " anno_realizzazione " SEMESTRE " semestre_realizzazione " CE " conto_energia " roe: " roe%) 
end

;; SET UP GRAFICO PBT
to set_y_range_plot_PBT
  set-current-plot "Pay Back Time"
  let cmin (- costo_impianto + 0 ) 
  set-plot-y-range cmin costo_impianto
  set-plot-x-range 0 durata_impianti 
end
  
;; UPDATE GRAFICO PBT AGENTE ZERO
to update_plot_PBT
  ask pf with [ semestre_realizzazione = time and ( vita_impianto >= 1 and vita_impianto <= 20 ) ]
  [
    let i 0  
    while [ i <= 10 ]
    [
      if  (id = (NAgentiFINAL * i)  and vita_impianto >= 1 and vita_impianto <= 20 )  
      [ 
        set-current-plot "Pay Back Time"
        ifelse (id > 50)
        [
          set-current-plot-pen (word "Van"( id / NAgentiFINAL - 1 ))
          plotxy (vita_impianto - 1.1 + (( id / NAgentiFINAL - 1 ) / 10 ) ) 0
        ]
        [
          set-current-plot-pen (word "Van"( id / NAgentiFINAL ))
          plotxy (vita_impianto - 1.1 + (( id / NAgentiFINAL ) / 10 ) ) 0
        ]
        plot last van        
      ]
      set i i + 1
    ]
  ]
end

;; UPDATE FINALE GRAFICO ROE E ROI
to update_plot_roe
  let i 0
  let g 0
  let cry 0
  let count_agenti 0 
  output-print      ("****************************************************************************************************")
  output-print ( word "***************************************************DATI ROE*****************************************") 
  while [i <= 6]
    [
      ; set g precision ( (sum [roe%] of pf with  [anno_realizzazione = 2007 + i ] ) / (NAgentiFINAL * 2 ) ) 3
      ifelse (2007 + i = 2007) [set count_agenti count_pf2007 + totneg_roe2007 ][ 
      ifelse (2007 + i = 2008) [set count_agenti count_pf2008 + totneg_roe2008 ][ 
      ifelse (2007 + i = 2009) [set count_agenti count_pf2009 + totneg_roe2009 ][ 
      ifelse (2007 + i = 2010) [set count_agenti count_pf2010 + totneg_roe2010 ][ 
      ifelse (2007 + i = 2011) [set count_agenti count_pf2011 + totneg_roe2011 ][ 
      ifelse (2007 + i = 2012) [set count_agenti count_pf2012 + totneg_roe2012 ][ 
      ifelse (2007 + i = 2013) [set count_agenti count_pf2013 + totneg_roe2013 ][ 
      ]]]]]]]
      ;; questa funzione non calcola correttamente il roe medio nel caso siano presenti molti agenti che falliscono a causa di un roe insufficiente, inoltre non vengono nemmeno
      ;; considerati i roe degli agenti che falliscono a causa di eccedenze dimensioni/budget --> in genere fornisce comunque una buona approssimazione e in ogni caso i calcoli 
      ;; corretti sono efettuati durante il calcolo del roe stimato medio
      if (count_agenti = 0) [ set count_agenti 1 ] ;; non crea problemi di divisione per zero nel caso di simulazioni dove nessun agente riesce a installare impianti
      set g precision ( (sum [roe%] of pf with  [anno_realizzazione = 2007 + i ]) / count_agenti ) 3
      set-current-plot "Average_ROE"
      set cry 2007 + i 
      set-current-plot-pen (word cry)
      auto-plot-off
      plotxy ( cry - 1  ) 0
      plot g  
      set i i + 1
      output-print ( word "Media ROE anno  "cry " :  " g "%" )
    ]  
end

;; UPDATE FINALE grafico con i kw istallati ogni anno, rappresentati come barre
to update_plot_kw_bars
  let i 0
  let g 0
  let cry 0
  while [i <= 6]
    [
      set-current-plot "kW_installed_bars"
      set cry 2007 + i 
      ;; soluzione orribile per disegnare i kW istallati ogni anno --> molto migliorabile
      ifelse cry = 2007 [ set g kW2007 ][
      ifelse cry = 2008 [ set g kW2008 ][
      ifelse cry = 2009 [ set g kW2009 ][
      ifelse cry = 2010 [ set g kW2010 ][
      ifelse cry = 2011 [ set g kW2011 ][
      ifelse cry = 2012 [ set g kW2012 ][
      ifelse cry = 2013 [ set g kW2013 ][
        ;; default case 
       ]]]]]]]
      set-current-plot-pen (word cry)
      auto-plot-off
      plotxy ( cry - 1  ) 0
      plot g  
      set i i + 1
    ]  
end


;; stampa valori medi di parametri come il roe_stimato degli agenti, il flusso cumulato, etc.. e altri valori utili in fase di debug
to print_simulation_info
  let i 0
  let cry 0
  let avg_roe_stimato 0
  let avg_stima_ric_incentivo 0
  let avg_stima_ric_autoconsumo 0
  let avg_stima_ric_vendita 0
  let avg_stima_van 0
  let avg_stima_kw_immessi 0
  let avg_stima_kw_prelevati 0
  let avg_stima_kw_autoconsumo 0
  let avg_stima_consumo_medio_annuale 0
  let avg_stima_kw_annui_impianto 0
  let avg_stima_flusso_cassa_cumulato 0
  let avg_costo_impianto 0
  let avg_ifin 0 ;; valore poco indicativo: nella media sommo anche i valori nulli relativi a chi non ha richiesto l'incentivo regionale
  let sum_roe 0 ; per sommare anche i roe degli agenti che sono morti durante la simulazione
  let count_agenti 0
  
  output-print ( word "***************************************************DATI ROE STIMATO : ANNO *****************************************") 
  while [i <= 6]
    [
      ;;set avg_roe_stimato precision ( (sum [roe_stimato] of pf with  [anno_realizzazione = 2007 + i ] ) / (NAgentiFINAL * 2 ) ) 3
      ifelse (2007 + i = 2007) [set count_agenti count_pf2007 + totneg_roe2007 set sum_roe (sum [roe_stimato] of pf with  [anno_realizzazione = 2007 + i ] ) + sum_roe_stimato_morti_2007 ][ 
      ifelse (2007 + i = 2008) [set count_agenti count_pf2008 + totneg_roe2008 set sum_roe (sum [roe_stimato] of pf with  [anno_realizzazione = 2007 + i ] ) + sum_roe_stimato_morti_2008 ][ 
      ifelse (2007 + i = 2009) [set count_agenti count_pf2009 + totneg_roe2009 set sum_roe (sum [roe_stimato] of pf with  [anno_realizzazione = 2007 + i ] ) + sum_roe_stimato_morti_2009 ][ 
      ifelse (2007 + i = 2010) [set count_agenti count_pf2010 + totneg_roe2010 set sum_roe (sum [roe_stimato] of pf with  [anno_realizzazione = 2007 + i ] ) + sum_roe_stimato_morti_2010 ][ 
      ifelse (2007 + i = 2011) [set count_agenti count_pf2011 + totneg_roe2011 set sum_roe (sum [roe_stimato] of pf with  [anno_realizzazione = 2007 + i ] ) + sum_roe_stimato_morti_2011 ][ 
      ifelse (2007 + i = 2012) [set count_agenti count_pf2012 + totneg_roe2012 set sum_roe (sum [roe_stimato] of pf with  [anno_realizzazione = 2007 + i ] ) + sum_roe_stimato_morti_2012 ][ 
      ifelse (2007 + i = 2013) [set count_agenti count_pf2013 + totneg_roe2013 set sum_roe (sum [roe_stimato] of pf with  [anno_realizzazione = 2007 + i ] ) + sum_roe_stimato_morti_2013 ][ 
      ]]]]]]]
      if count_agenti = 0 [ set count_agenti 1 ] ;; non crea problemi di divisione per zero nel caso di simulazioni dove nessun agente riesce a installare impianti
      set avg_roe_stimato precision ( sum_roe / count_agenti ) 3
;      set avg_stima_ric_incentivo precision ( (sum [stima_ric_incentivo] of pf with  [anno_realizzazione = 2012 + i ] ) / (NAgentiFINAL * 2 ) ) 3
;      set avg_stima_ric_autoconsumo precision ( (sum [stima_ric_autoconsumo] of pf with  [anno_realizzazione = 2012 + i ] ) / (NAgentiFINAL * 2 ) ) 3
;      set avg_stima_ric_vendita precision ( (sum [stima_ric_vendita] of pf with  [anno_realizzazione = 2012 + i ] ) / (NAgentiFINAL * 2 ) ) 3
;      set avg_stima_van precision ( (sum [stima_van] of pf with  [anno_realizzazione = 2012 + i ] ) / (NAgentiFINAL * 2 ) ) 3
;      set avg_stima_kw_immessi precision ( (sum [stima_kw_immessi] of pf with  [anno_realizzazione = 2012 + i ] ) / (NAgentiFINAL * 2 ) ) 3
;      set avg_stima_kw_prelevati precision ( (sum [stima_kw_prelevati] of pf with  [anno_realizzazione = 2012 + i ] ) / (NAgentiFINAL * 2 ) ) 3
;      set avg_stima_kw_autoconsumo precision ( (sum [stima_kw_autoconsumo] of pf with  [anno_realizzazione = 2012 + i ] ) / (NAgentiFINAL * 2 ) ) 3
;      set avg_stima_flusso_cassa_cumulato precision ( (sum [stima_flusso_cassa_cumulato] of pf with  [anno_realizzazione = 2012 + i ] ) / (NAgentiFINAL * 2 ) ) 3
;      set avg_stima_consumo_medio_annuale precision ( (sum [stima_consumo_medio_annuale] of pf with  [anno_realizzazione = 2012 + i ] ) / (NAgentiFINAL * 2 ) ) 3
;      set avg_stima_kw_annui_impianto precision ( (sum [stima_kw_annui_impianto] of pf with  [anno_realizzazione = 2012 + i ] ) / (NAgentiFINAL * 2 ) ) 3
;      set avg_costo_impianto precision ( (sum [costo_impianto] of pf with  [anno_realizzazione = 2012 + i ] ) / (NAgentiFINAL * 2 ) ) 3
;      set avg_ifin precision ( (sum [ifin] of pf with  [anno_realizzazione = 2012 + i ] ) / (NAgentiFINAL * 2 ) ) 3
      set cry 2007 + i 
      set i i + 1
      
      output-print ( word "Media ROE anno -- STIMA "cry " :  " avg_roe_stimato "%" )
;      output-print ( word "-------- " cry "---------") 
;      output-print ( word "avg_roe_stimato:  " avg_roe_stimato "%" )
;      output-print ( word "avg_stima_flusso_cassa_cumulato:  " avg_stima_flusso_cassa_cumulato )
;      output-print ( word "avg_costo_impianto:  " avg_costo_impianto )
;      output-print ( word "avg_ifin (sottostimato):  " avg_ifin )
;      output-print ( word "avg_stima_ric_incentivo:  " avg_stima_ric_incentivo )
;      output-print ( word "avg_stima_ric_autoconsumo:  " avg_stima_ric_autoconsumo )
;      output-print ( word "avg_stima_ric_vendita:  " avg_stima_ric_vendita )
;      output-print ( word "avg_stima_van:  " avg_stima_van )
;      output-print ( word "avg_stima_kw_immessi:  " avg_stima_kw_immessi )
;      output-print ( word "avg_stima_kw_prelevati:  " avg_stima_kw_prelevati )
;      output-print ( word "avg_stima_kw_autoconsumo:  " avg_stima_kw_autoconsumo )
;      output-print ( word "avg_stima_consumo_medio_annuale:  " avg_stima_consumo_medio_annuale )
;      output-print ( word "avg_stima_kw_annui_impianto:  " avg_stima_kw_annui_impianto )
      
    ]  
    
    set i 0
    set cry 0
    set avg_roe_stimato 0
    ;; questa stima del roe medio per semestre non è corretta: per calcolare il valore medio vengono conteggiati a denominatore tutti gli agenti creati nel semestre, MA solo una parte 
    ;; di essi sarà ancora "viva" al termine della simulazione (eccedenza costi, dimensioni, roe insufficiente,etc.) quindi il valore al numeratore non è relativo a tutti gli agenti
    ;; creati, ma solo a quelli non morti prematuramente --> ne consegue che questo roe medio per semestre è fortemente sottostimato, poichè in genere solamente 50-55% degli agenti
    ;; riesce ad installare i pannelli  
    output-print ( word "***************************************************DATI ROE STIMATO : SEMESTRE *****************************************") 
    while [i <= 6]    [
      set avg_roe_stimato precision ( (sum [roe_stimato] of pf with [anno_realizzazione = 2007 + i and semestre_realizzazione = 1]  ) / (NAgentiFINAL) ) 3
      set cry 2007 + i 
      output-print ( word "Media ROE anno - "cry " Semestre 1:  " avg_roe_stimato "%" )
      set avg_roe_stimato precision ( (sum [roe_stimato] of pf with [anno_realizzazione = 2007 + i and semestre_realizzazione = 2] ) / (NAgentiFINAL) ) 3
      output-print ( word "Media ROE anno - "cry " Semestre 2:  " avg_roe_stimato "%" )
      set i i + 1
    ]  
    
    set i 0
    set cry 0
    set avg_roe_stimato 0
    set count_agenti 0
    output-print ( word "***************************************************DATI ROE STIMATO : CONTO ENERGIA *****************************************") 
    while [i <= 3]
    [
      ;; il roe medio calcolato per conto energia è solamente un'approssimazione: il numero di agenti utilizzato al denominatore è una stima (abbastanza precisa) del numero di agenti
      ;; che rientrano nei conti energia 
      ifelse (2 + i = 2) [set count_agenti NAgentiFINAL * 8.6 ;; i semestri del 2007-2010 più il 60% circa degli agenti del primo semestre 2011
         set sum_roe (sum [roe_stimato] of pf with [conto_energia = 2 + i ]) + sum_roe_stimato_morti_CE_2 ][ 
      ifelse (2 + i = 3) [set count_agenti NAgentiFINAL * 0.4 
         set sum_roe (sum [roe_stimato] of pf with [conto_energia = 2 + i ]) + sum_roe_stimato_morti_CE_3 ][ ;; il 40% circa degli agenti del primo semestre 2011
      ifelse (2 + i = 4) [set count_agenti NAgentiFINAL * 2 
         set sum_roe (sum [roe_stimato] of pf with [conto_energia = 2 + i ]) + sum_roe_stimato_morti_CE_4 ][ 
      ifelse (2 + i = 5) [set count_agenti NAgentiFINAL * 3 
         set sum_roe (sum [roe_stimato] of pf with [conto_energia = 2 + i ]) + sum_roe_stimato_morti_CE_5 ][
      ]]]]
      ;; set avg_roe_stimato precision ( (sum [roe_stimato] of pf with  [conto_energia = 2 + i ] ) / count_agenti ) 3
      set avg_roe_stimato precision ( sum_roe / count_agenti ) 3
      set cry 2 + i 
      set i i + 1
      
      output-print ( word "Media ROE Conto Energia -- STIMA " cry " : " avg_roe_stimato "%" )
    ]  
    
end


;; AGGIORNA I COSTI SOSTENUTI PER GLI INCENTIVI SULLA PRODUZIONE (una finezza incredibile!!)
to aggiorna_incentivi_prod
  ask pf 
  [
    
  ifelse anno_realizzazione = 2007 [ foreach ricavi_incentivi
      [
        set INCENTIVO_PRO2007 ROUND (INCENTIVO_PRO2007 + ?)
      ] ][
  ifelse anno_realizzazione = 2008 [ foreach ricavi_incentivi
      [
        set INCENTIVO_PRO2008 ROUND (INCENTIVO_PRO2008 + ?)
      ] ][
  ifelse anno_realizzazione = 2009 [ foreach ricavi_incentivi
      [
        set INCENTIVO_PRO2009 ROUND (INCENTIVO_PRO2009 + ?)
      ] ][
  ifelse anno_realizzazione = 2010 [ foreach ricavi_incentivi
      [
        set INCENTIVO_PRO2010 ROUND (INCENTIVO_PRO2010 + ?)
      ] ][
  ifelse anno_realizzazione = 2011 [ foreach ricavi_incentivi
      [
        set INCENTIVO_PRO2011 ROUND (INCENTIVO_PRO2011 + ?)
      ] ][
  ifelse anno_realizzazione = 2012 [ foreach ricavi_incentivi
      [
        set INCENTIVO_PRO2012 ROUND (INCENTIVO_PRO2012 + ?)
      ] ][
  ifelse anno_realizzazione = 2013 [ foreach ricavi_incentivi
        [
          set INCENTIVO_PRO2013 ROUND (INCENTIVO_PRO2013 + ?)
        ]
        foreach ricavi_vendita
        [
          set INCENTIVO_PRO2013 ROUND (INCENTIVO_PRO2013 + ?)
        ] ][
  ifelse anno_realizzazione = 2014 [ foreach ricavi_incentivi
          [
            set INCENTIVO_PRO2014 ROUND (INCENTIVO_PRO2014 + ?)
          ]
          foreach ricavi_vendita
          [
            set INCENTIVO_PRO2014 ROUND (INCENTIVO_PRO2014 + ?)
          ] ][
  ifelse anno_realizzazione = 2015 [ foreach ricavi_incentivi
            [
              set INCENTIVO_PRO2015 ROUND (INCENTIVO_PRO2015 + ?)
            ]
            foreach ricavi_vendita
            [
              set INCENTIVO_PRO2015 ROUND (INCENTIVO_PRO2015 + ?)
            ] ][
  ifelse anno_realizzazione = 2016 [ foreach ricavi_incentivi
            [
              set INCENTIVO_PRO2016 ROUND (INCENTIVO_PRO2016 + ?)
            ]
            foreach ricavi_vendita
            [
              set INCENTIVO_PRO2016 ROUND (INCENTIVO_PRO2016 + ?)
            ] ][
    ;; default
  ]]]]]]]]]]
      
  ]
  
end

;; AGGIORNA SPESA TOTALE INCENTIVI + INSTALLAZIONE
to aggiorna_incentivi_tot
  set INCENTIVO_PROTOT ROUND (INCENTIVO_PRO2007 + INCENTIVO_PRO2008 + INCENTIVO_PRO2009 + INCENTIVO_PRO2010 + INCENTIVO_PRO2011 + INCENTIVO_PRO2012 + INCENTIVO_PRO2013 + INCENTIVO_PRO2014 + INCENTIVO_PRO2015 + INCENTIVO_PRO2016)
  set TOT_SPESA ROUND (INCENTIVO_PROTOT + INCENTIVO_INSTOT)
  set TOT_SPESA2007 (INCENTIVO_PRO2007 + INCENTIVO_INST2007)
  set TOT_SPESA2008 (INCENTIVO_PRO2008 + INCENTIVO_INST2008)
  set TOT_SPESA2009 (INCENTIVO_PRO2009 + INCENTIVO_INST2009)
  set TOT_SPESA2010 (INCENTIVO_PRO2010 + INCENTIVO_INST2010)
  set TOT_SPESA2011 (INCENTIVO_PRO2011 + INCENTIVO_INST2011)
  set TOT_SPESA2012 (INCENTIVO_PRO2012 + INCENTIVO_INST2012)
  set TOT_SPESA2013 (INCENTIVO_PRO2013 + INCENTIVO_INST2013)
  set TOT_SPESA2014 (INCENTIVO_PRO2014 + INCENTIVO_INST2014)
  set TOT_SPESA2015 (INCENTIVO_PRO2015 + INCENTIVO_INST2015)
  set TOT_SPESA2016 (INCENTIVO_PRO2016 + INCENTIVO_INST2016)
end

;; STAMPA DEL RESOCONTO FINALE
to stampa_resoconto
  output-print      ("****************************************************************************************************")
  output-print (word    "**************************************RESOCONTO IMPIANTI*****************************************")
  output-print ( word   "IMPIANTI REALIZZATI NEL 2007 "  count_pf2007 " RAPPORTO 2007 "  r2007 "%")
  output-print ( word   "IMPIANTI REALIZZATI NEL 2008 "  count_pf2008 " RAPPORTO 2008 "  r2008 "%")
  output-print ( word   "IMPIANTI REALIZZATI NEL 2009 "  count_pf2009 " RAPPORTO 2009 "  r2009 "%")
  output-print ( word   "IMPIANTI REALIZZATI NEL 2010 "  count_pf2010 " RAPPORTO 2010 "  r2010 "%")
  output-print ( word   "IMPIANTI REALIZZATI NEL 2011 "  count_pf2011 " RAPPORTO 2011 "  r2011 "%")
  output-print ( word   "IMPIANTI REALIZZATI NEL 2012 "  count_pf2012 " RAPPORTO 2012 "  r2012 "%")
  output-print (word    "IMPIANTI REALIZZATI NEL 2013 " count_pf2013 " RAPPORTO 2013 " r2013 "%")
  output-print (word    "IMPIANTI REALIZZATI NEL 2014 " count_pf2014 " RAPPORTO 2014 " r2014 "%")
  output-print (word    "IMPIANTI REALIZZATI NEL 2015 " count_pf2015 " RAPPORTO 2015 " r2015 "%")  
  output-print (word    "IMPIANTI REALIZZATI NEL 2016 " count_pf2016 " RAPPORTO 2016 " r2016 "%") 
  output-print      ("****************************************************************************************************")
  output-print      ("****************************************************************************************************")
  output-print (word "************************************RESOCONTO POTENZA INSTALLATA************************************")
  output-print (word "ANNO 2007: " kW2007 " KwP")
  output-print (word "ANNO 2008: " kW2008 " KwP")
  output-print (word "ANNO 2009: " kW2009 " KwP")
  output-print (word "ANNO 2010: " kW2010 " KwP")
  output-print (word "ANNO 2011: " kW2011 " KwP")
  output-print (word "ANNO 2012: " kW2012 " KwP")
  output-print (word "ANNO 2013: " kW2013 " KwP")
  output-print (word "ANNO 2014: " kW2014 " KwP")
  output-print (word "ANNO 2015: " kW2015 " KwP")
  output-print (word "ANNO 2016: " kW2016 " KwP")
  output-print (word "TOTALE [2007..2016]: " kWTOT " KwP")
  output-print      ("****************************************************************************************************")
  output-print (word "************************************RESOCONTO INCENTIVI ALLA PRODUZIONE*****************************")
  output-print (word "ANNO 2007: " INCENTIVO_PRO2007 " euro")
  output-print (word "ANNO 2008: " INCENTIVO_PRO2008 " euro")
  output-print (word "ANNO 2009: " INCENTIVO_PRO2009 " euro")
  output-print (word "ANNO 2010: " INCENTIVO_PRO2010 " euro")
  output-print (word "ANNO 2011: " INCENTIVO_PRO2011 " euro")
  output-print (word "ANNO 2012: " INCENTIVO_PRO2012 " euro")
  output-print (word "ANNO 2013: " INCENTIVO_PRO2013 " euro")
  output-print (word "ANNO 2014: " INCENTIVO_PRO2014 " euro")
  output-print (word "ANNO 2015: " INCENTIVO_PRO2015 " euro")
  output-print (word "ANNO 2016: " INCENTIVO_PRO2016 " euro")
  output-print (word "TOTALE [2012..2016]: " INCENTIVO_PROTOT " euro")
  output-print      ("****************************************************************************************************")
  output-print (word "************************************RESOCONTO INCENTIVI INSTALLAZIONE*******************************")
  output-print (word "ANNO 2007: " INCENTIVO_INST2007 " euro")
  output-print (word "ANNO 2008: " INCENTIVO_INST2008 " euro")
  output-print (word "ANNO 2009: " INCENTIVO_INST2009 " euro")
  output-print (word "ANNO 2010: " INCENTIVO_INST2010 " euro")
  output-print (word "ANNO 2011: " INCENTIVO_INST2011 " euro")
  output-print (word "ANNO 2012: " INCENTIVO_INST2012 " euro")
  output-print (word "ANNO 2013: " INCENTIVO_INST2013 " euro")
  output-print (word "ANNO 2014: " INCENTIVO_INST2014 " euro")
  output-print (word "ANNO 2015: " INCENTIVO_INST2015 " euro")
  output-print (word "ANNO 2016: " INCENTIVO_INST2016 " euro")
  output-print (word "TOTALE [2012..2016]: " INCENTIVO_INSTOT " euro")
  output-print   ("")
  output-print (word "************************************RESOCONTO TOTALE SPESA******************************************")
  output-print (word "ANNO 2007: " TOT_SPESA2007  " euro")
  output-print (word "ANNO 2008: " TOT_SPESA2008  " euro")
  output-print (word "ANNO 2009: " TOT_SPESA2009  " euro")
  output-print (word "ANNO 2010: " TOT_SPESA2010  " euro")
  output-print (word "ANNO 2011: " TOT_SPESA2011  " euro")
  output-print (word "ANNO 2012: " TOT_SPESA2012  " euro")
  output-print (word "ANNO 2013: " TOT_SPESA2013  " euro")
  output-print (word "ANNO 2014: " TOT_SPESA2014  " euro")
  output-print (word "ANNO 2015: " TOT_SPESA2015  " euro")
  output-print (word "ANNO 2016: " TOT_SPESA2016  " euro")
  output-print (word "TOTALE [2012..2016]: " TOT_SPESA " euro")
  output-print (word "************************************RESOCONTO BUDGET ANNUALE******************************************")
  output-print (word "ANNO 2007: " Budget2007  " euro")
  output-print (word "ANNO 2008: " Budget2008  " euro")
  output-print (word "ANNO 2009: " Budget2009  " euro")
  output-print (word "ANNO 2010: " Budget2010  " euro")
  output-print (word "ANNO 2011: " Budget2011  " euro")
  output-print (word "ANNO 2012: " Budget2012  " euro")
  output-print (word "ANNO 2013: " Budget2013  " euro")
  output-print (word "ANNO 2014: " Budget2014  " euro")
  output-print (word "ANNO 2015: " Budget2015  " euro")
  output-print (word "ANNO 2016: " Budget2016  " euro")
  output-print (word "ANNO 2017: " Budget2017  " euro")
end

;; STAMPA DATI DEGLI AGENTI....VARIARE IN BASE ALL'INTERESSE
to stampa_agenti
  ask pf[
    
    let last_ricavi_incentivi last ricavi_incentivi
    let last_ricavi_autoconsumo last ricavi_autoconsumo
    let last_ricavi_vendita last ricavi_vendita
    let costi_annuali precision ((costo_impianto * Manutenzione_anno_%costo_totale)  / 100 ) 2
    
    ;; condizione per debug
    ;; if ( id <= 60 and roe% < roe_stimato)
    
    output-print      ("****************************************************************************************************")
    output-print ( word "************************************DATI FINALI IMPIANTO DELL'AGENTE " id "***************************")
    
    ;; ;; output-print ( word " ricavi_incentivi          " ricavi_incentivi )
    ;; ;; output-print ( word " ricavi_autoconsumo        " ricavi_autoconsumo )
    ;; ;; output-print ( word  " ricavi_vendita            " ricavi_vendita )
    ;; ;; output-print (word   " flusso_cassa              " flusso_cassa )
    
    ;; output-print (word   " kw_immessi              " kw_immessi )
    ;; output-print (word   " stima_kw_immessi              " stima_kw_immessi )
    ;; output-print (word   " kw_prelevati              " kw_prelevati )
    ;; output-print (word   " stima_kw_prelevati              " stima_kw_prelevati )
    ;; output-print (word   " kw_autoconsumo              " kw_autoconsumo )
    ;; output-print (word   " stima_kw_autoconsumo              " stima_kw_autoconsumo )
    ;; output-print (word   " consumo_medio_annuale              " consumo_medio_annuale )
    ;; output-print (word   " stima_consumo_medio_annuale              " stima_consumo_medio_annuale )
    ;; output-print (word   " kw_annui_impianto              " kw_annui_impianto )
    ;; output-print (word   " stima_kw_annui_impianto              " stima_kw_annui_impianto )
    
    ;; output-print (word   " ricavi_incentivi              " last_ricavi_incentivi )
    ;; output-print (word   " stima_ric_incentivo              " stima_ric_incentivo )
    
    ;; output-print (word   " ricavi_autoconsumo              " last_ricavi_autoconsumo )
    ;; output-print (word   " stima_ric_autoconsumo              " stima_ric_autoconsumo )
    
    ;; output-print (word   " ricavi_vendita              " last_ricavi_vendita )
    ;; output-print (word   " stima_ric_vendita              " stima_ric_vendita )
    
    ;; output-print (word   " costi_annuali              " costi_annuali )
    
    output-print (word   " flusso_cassa_cumulato              " flusso_cassa_cumulato )
    output-print (word   " stima_flusso_cassa_cumulato              " stima_flusso_cassa_cumulato )
    
    output-print (word   " flusso_cassa_attualizzato_cumulato              " flusso_cassa_attualizzato_cumulato )
    output-print (word   " stima_flusso_cassa_attualizzato_cumulato              " stima_flusso_cassa_attualizzato_cumulato )
    
    output-print (word   " ifin                       " ifin )
    
    let last_van last van
    ;;output-print (word   " van                       " van )
    ;; output-print (word   " van                       " last_van )
    ;; output-print (word   " stima_van                       " stima_van )
    
    output-print (word   " ROE                       " roe% )
    output-print (word   " ROE stimato                      " roe_stimato )
    
    ;; output-print (word   " Finanziamento regionale                       " freg)
    
   
    ;; output-print      ("****************************************************************************************************")
    
  ] 
end

;; ELIMINA SOVRAPPOSIZIONI NEL MONDO VIRTUALE DEGLI IMPIANTI.... 
to elimina_sovrapposizioni
  rt random-float 360
  fd random-float 1
  if any? other pf in-radius 1
    [elimina_sovrapposizioni ]
end

;;STAMPA RISULTATI SINTETICI IN FORMATO ADATTO ( .PL )
to write_pl_file
  ;;file-open "output/risultati_sintetici.pl"
  ;;file-open "/home/b0rgh/ECLiPSe/sourceTesi/risultati_sintetici.pl"
  ;;file-print (word "result(" INCENTIVO_INSTOT ", " %_Incentivi_Installazione ", " INCENTIVO_PROTOT ", " TOT_SPESA ", " kWTOT ").")
  ;;file-close
  file-open "/media/sda4/ePolicy/simulationModel/output/risultati_sintetici.pl"
  
  ;;versione iniziale che produce risultati relativi principalmente a tipo di incentivo, buget PV, spesa per PV e produzione finale
  ;;file-print (word "result_new('"fr"'," INCENTIVO_INSTOT ", " %_Incentivi_Installazione ", " TOT_SPESA ","BudgetRegione","BudgetCorrente"," kWTOT").")
  file-print (word "result_new('"fr"'," INCENTIVO_INSTOT ", " %_Incentivi_Installazione ", " TOT_SPESA ","BudgetRegione","Budget2017"," kWTOT").")
  
  ;;seconda versione necessaria per considerare anche l'interazione sociale
  ;;file-print (word "result_new('"fr"'," INCENTIVO_INSTOT ", " %_Incentivi_Installazione ", " TOT_SPESA ","BudgetRegione","BudgetCorrente"," kWTOT"," Raggio","Sensibilita ").")
  file-close
end

;; stampa su file i kW installati ogni anno con i vari Conto Energia
to write_kW_CE_file
  file-open "/media/sda4/ePolicy/simulationModel/output/kW_CE.csv"
  ;; i valori presenti in ogni riga sono: kW 2007, kW 2008, kW 2009, kW 2010, kW 2011, kW 2012, kW 2013,
  ;; file-print (word kW2007 ", " kW2008 ", " kW2009 ", " kW2010 ", " kW2011 ", " kW2012 ", " kW2013)
  
  ;; ora stampo i kw annuali divisi per classe di potenza (fasce potenza 1,2,3)
;  file-print (word kW_1FP_2007 ", " kW_1FP_2008 ", " kW_1FP_2009 ", " kW_1FP_2010 ", " kW_1FP_2011 ", " kW_1FP_2012 ", " kW_1FP_2013 ", "
;    kW_2FP_2007 ", " kW_2FP_2008 ", " kW_2FP_2009 ", " kW_2FP_2010 ", " kW_2FP_2011 ", " kW_2FP_2012 ", " kW_2FP_2013 ", "
;    kW_3FP_2007 ", " kW_3FP_2008 ", " kW_3FP_2009 ", " kW_3FP_2010 ", " kW_3FP_2011 ", " kW_3FP_2012 ", " kW_3FP_2013 )
  
  file-print (word kW_1FP_2007 ", " kW_1FP_2008 ", " kW_1FP_2009 ", " kW_1FP_2010 ", " kW_1FP_2011 ", " kW_1FP_2012 ", " kW_1FP_2013 ", "
    kW_2FP_2007 ", " kW_2FP_2008 ", " kW_2FP_2009 ", " kW_2FP_2010 ", " kW_2FP_2011 ", " kW_2FP_2012 ", " kW_2FP_2013 ", "
    kW_3FP_2007 ", " kW_3FP_2008 ", " kW_3FP_2009 ", " kW_3FP_2010 ", " kW_3FP_2011 ", " kW_3FP_2012 ", " kW_3FP_2013 ", "
    kW2007 ", " kW2008 ", " kW2009 ", " kW2010 ", " kW2011 ", " kW2012 ", " kW2013 )
  
  file-close
  
end


;; stampa su file il numero di impianti installati ogni anno con i vari Conto Energia
to write_count_pf_CE_file
  file-open "/media/sda4/ePolicy/simulationModel/output/count_pf_CE.csv"
  
  ;; stampo il numero di impianti installati annualmente divisi per classe di potenza (fasce potenza 1,2,3)
  file-print (word count_pf_1FP_2007 ", " count_pf_1FP_2008 ", " count_pf_1FP_2009 ", " count_pf_1FP_2010 ", " count_pf_1FP_2011 ", " count_pf_1FP_2012 ", " count_pf_1FP_2013 ", "
    count_pf_2FP_2007 ", " count_pf_2FP_2008 ", " count_pf_2FP_2009 ", " count_pf_2FP_2010 ", " count_pf_2FP_2011 ", " count_pf_2FP_2012 ", " count_pf_2FP_2013 ", "
    count_pf_3FP_2007 ", " count_pf_3FP_2008 ", " count_pf_3FP_2009 ", " count_pf_3FP_2010 ", " count_pf_3FP_2011 ", " count_pf_3FP_2012 ", " count_pf_3FP_2013 ", ")
  
  file-close
end
@#$#@#$#@
GRAPHICS-WINDOW
255
8
624
398
30
30
5.9
1
10
1
1
1
0
1
1
1
-30
30
-30
30
1
1
1
ticks
30.0

BUTTON
81
10
144
43
NIL
setup\n
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
7
157
217
190
Consumo_medio_annuale_KWh
Consumo_medio_annuale_KWh
2500
30000
15200
10
1
KWh
HORIZONTAL

SLIDER
8
247
225
280
Budget_Medio_MiliaiaEuro
Budget_Medio_MiliaiaEuro
10
200
100
1
1
Mila
HORIZONTAL

SLIDER
8
120
217
153
M2_Disposizione
M2_Disposizione
8
200
100
1
1
m2
HORIZONTAL

SLIDER
8
287
250
320
Media%_copertura_consumi_richiesta
Media%_copertura_consumi_richiesta
0
100
70
1
1
%
HORIZONTAL

SLIDER
6
427
251
460
Irradiazione_media_annua_kwh_kwp
Irradiazione_media_annua_kwh_kwp
900
1900
1350
1
1
KWh
HORIZONTAL

SLIDER
5
471
249
504
Costo_Medio_kwP
Costo_Medio_kwP
3000
5000
3500
50
1
euro
HORIZONTAL

TEXTBOX
10
96
177
114
Parametri Agente Zero 
14
73.0
1

TEXTBOX
681
555
818
573
NIL
11
0.0
1

MONITOR
1531
18
1708
63
Numero Agenti scelta positiva
count_pf
17
1
11

TEXTBOX
853
519
1003
537
Prestiti\n
14
15.0
1

SLIDER
850
549
1085
582
Anni_Restituzione_Prestiti
Anni_Restituzione_Prestiti
1
20
20
1
1
anni
HORIZONTAL

SLIDER
849
590
1087
623
Percentuale_Interessi_Prestito
Percentuale_Interessi_Prestito
1
8
4.3
0.1
1
%
HORIZONTAL

BUTTON
147
10
210
43
NIL
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
1458
17
1514
62
Anno
anno
17
1
11

MONITOR
1377
17
1442
62
Semestre
time 
17
1
11

TEXTBOX
435
407
568
425
Prezzi Energia al Kwh\n
14
16.0
1

TEXTBOX
292
414
427
665
		Consumo annuo in kWh	\n\ninferiori a  1.000\n	\n\nda 1.000 a  2.500\n\n\nda 2.500 a 5.000\n\n\nda 5.000 a 15.000\n\n\noltre 15.000	\n
12
0.0
1

SLIDER
396
434
617
467
costo_kwh_fascia1
costo_kwh_fascia1
0.250
0.299
0.278
0.001
1
euro\KWh
HORIZONTAL

SLIDER
396
478
618
511
costo_kwh_fascia2
costo_kwh_fascia2
0.140
0.189
0.162
0.001
1
euro\KWh
HORIZONTAL

SLIDER
395
524
620
557
costo_kwh_fascia3
costo_kwh_fascia3
0.170
0.219
0.194
0.001
1
euro\KWh
HORIZONTAL

SLIDER
396
570
621
603
costo_kwh_fascia4
costo_kwh_fascia4
0.220
0.269
0.246
0.001
1
euro\KWh
HORIZONTAL

SLIDER
395
621
620
654
costo_kwh_fascia5
costo_kwh_fascia5
0.250
0.299
0.276
0.001
1
euro\KWh
HORIZONTAL

CHOOSER
6
620
248
665
Perdita_efficienza_annuale_pannello
Perdita_efficienza_annuale_pannello
0.3 0.5 0.8 1
1

SLIDER
849
475
1083
508
variazione_annuale_prezzi_elettricita
variazione_annuale_prezzi_elettricita
-10
10
1.8
0.1
1
%
HORIZONTAL

CHOOSER
9
673
248
718
Manutenzione_anno_%costo_totale
Manutenzione_anno_%costo_totale
0.5 0.6 0.7 0.8 0.9 1 1.1 1.2 1.3 1.4 1.5
10

CHOOSER
7
568
248
613
Riduzione_anno_%costo_pannello
Riduzione_anno_%costo_pannello
0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2 2.1 2.2 2.3 2.4 2.5 2.6 2.7 2.8 2.9 3 3.1 3.2 3.3 3.4 3.5 3.6 3.7 3.8 3.9 4
29

TEXTBOX
11
405
244
439
Fotovoltaico Tecnologia e Costi
14
105.0
1

CHOOSER
8
196
217
241
Aumento_%annuo_consumi
Aumento_%annuo_consumi
-1 -0.9 -0.8 -0.7 -0.6 -0.5 -0.4 -0.3 -0.2 -0.1 0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9
19

BUTTON
7
10
78
43
NIL
default
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

CHOOSER
6
514
248
559
Tecnologia_Pannello
Tecnologia_Pannello
"Monocristallini" "Policristallini" "Silicio_amorfo"
0

SLIDER
8
50
217
83
NumeroAgenti
NumeroAgenti
1
250
200
1
1
NIL
HORIZONTAL

SLIDER
848
430
1082
463
Tasso_lordo_rendimento_BOT
Tasso_lordo_rendimento_BOT
1
6
2.147
0.001
1
%
HORIZONTAL

OUTPUT
2039
401
2705
776
9

PLOT
638
10
1349
396
Pay Back Time
Years
Euro
0.0
20.0
-4000.0
4000.0
false
true
"" ""
PENS
"axis" 1.0 0 -16777216 false "" ""
"Van0" 0.1 1 -16777216 true "" ""
"Van1" 0.1 1 -8330359 true "" ""
"Van2" 0.1 1 -5825686 true "" ""
"Van3" 0.1 1 -6459832 true "" ""
"Van4" 0.1 1 -15637942 true "" ""
"Van5" 0.1 1 -1264960 true "" ""
"Van6" 0.1 1 -13360827 true "" ""
"Van7" 0.1 1 -955883 true "" ""
"Van8" 0.1 1 -7500403 true "" ""
"Van9" 0.1 1 -2674135 true "" ""

PLOT
2054
44
2629
372
Average_ROE
anni
Roe
2007.0
2017.0
0.0
20.0
true
true
"" ""
PENS
"2012" 1.0 1 -10899396 true "" ""
"2013" 1.0 1 -6459832 true "" ""
"2014" 1.0 1 -16777216 true "" ""
"2015" 1.0 1 -13345367 true "" ""
"2016" 1.0 1 -2674135 true "" ""
"2007" 1.0 1 -7500403 true "" ""
"2008" 1.0 1 -955883 true "" ""
"2009" 1.0 1 -1184463 true "" ""
"2010" 1.0 1 -13840069 true "" ""
"2011" 1.0 1 -14835848 true "" ""

TEXTBOX
851
402
1108
436
Attualizzazione
14
15.0
1

MONITOR
1384
386
1513
431
kw INSTALLATI 2012
kW2012
17
1
11

MONITOR
1384
604
1513
649
kw INSTALLATI 2016
kW2016
17
1
11

MONITOR
1383
663
1515
708
kw INSTALLATI TOT
kWTOT
17
1
11

MONITOR
1384
436
1512
481
kw INSTALLATI 2013
kW2013\n
17
1
11

MONITOR
1385
492
1513
537
kw INSTALLATI 2014
kW2014
17
1
11

MONITOR
1385
550
1513
595
kw INSTALLATI 2015
kW2015
17
1
11

SWITCH
643
474
829
507
Incentivi_Installazione
Incentivi_Installazione
1
1
-1000

CHOOSER
643
520
829
565
%_Incentivi_Installazione
%_Incentivi_Installazione
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
9

MONITOR
1527
493
1723
538
INCENTIVI INSTALLAZIONE 2014
INCENTIVO_INST2014
2
1
11

MONITOR
1526
386
1722
431
INCENTIVI INSTALLAZIONE 2012
INCENTIVO_INST2012
2
1
11

MONITOR
1527
439
1723
484
INCENTIVI INSTALLAZIONE 2013
INCENTIVO_INST2013
2
1
11

MONITOR
1527
550
1723
595
INCENTIVI INSTALLAZIONE 2015
INCENTIVO_INST2015
2
1
11

MONITOR
1525
606
1721
651
INCENTIVI INSTALLAZIONE 2016
INCENTIVO_INST2016
2
1
11

MONITOR
1524
660
1723
705
INCENTIVI INSTALLAZIONE TOTALI
INCENTIVO_INSTOT
200
1
11

MONITOR
1734
384
1876
429
INCENTIVI  2012
INCENTIVO_PRO2012
17
1
11

MONITOR
1735
441
1878
486
INCENTIVI 2013
INCENTIVO_PRO2013
17
1
11

MONITOR
1736
495
1876
540
INCENTIVI 2014
INCENTIVO_PRO2014
17
1
11

MONITOR
1736
553
1875
598
INCENTIVI 2015
INCENTIVO_PRO2015
17
1
11

MONITOR
1736
605
1877
650
INCENTIVI 2016
INCENTIVO_PRO2016
17
1
11

MONITOR
1737
663
1879
708
INCENTIVI 
INCENTIVO_PROTOT
200
1
11

MONITOR
1894
385
2020
430
TOTALE SPESA 2012
TOT_SPESA2012
17
1
11

MONITOR
1895
440
2020
485
TOTALE SPESA 2013
TOT_SPESA2013
17
1
11

MONITOR
1895
496
2020
541
TOTALE SPESA 2014
TOT_SPESA2014
17
1
11

MONITOR
1895
550
2019
595
TOTALE SPESA 2015
TOT_SPESA2015
17
1
11

MONITOR
1895
609
2023
654
TOTALE SPESA 2016
TOT_SPESA2016
17
1
11

MONITOR
1896
661
2022
706
SPESA TOTALE
TOT_SPESA
200
1
11

SWITCH
644
576
827
609
Varia_Tariffe_Incetivanti
Varia_Tariffe_Incetivanti
1
1
-1000

CHOOSER
645
618
829
663
%_Variazione_Tariffe
%_Variazione_Tariffe
-30 -29 -28 -27 -26 -25 -24 -23 -22 -21 -20 -19 -18 -17 -16 -15 -14 -13 -12 -11 -10 -9 -8 -7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
30

TEXTBOX
646
404
796
422
Strumenti incentivi
14
105.0
1

SWITCH
8
332
195
365
LeggiSerieStoriche
LeggiSerieStoriche
1
1
-1000

TEXTBOX
1379
83
1529
101
POTENZA INSTALLATA
11
55.0
0

TEXTBOX
1522
84
1711
112
SPESA INCENTIVI INSTALLAZIONE
11
0.0
1

TEXTBOX
1729
85
1889
113
SPESA INCENTIVI PRODUZIONE
11
0.0
1

TEXTBOX
1894
84
2044
102
TOTALE SPESA
11
115.0
0

SWITCH
643
431
830
464
Incentivi_Dinamici
Incentivi_Dinamici
1
1
-1000

TEXTBOX
17
774
251
806
Incentivi regionali
14
105.0
1

CHOOSER
16
798
154
843
fr
fr
"Nessuno" "Asta" "Conto interessi" "Rotazione" "Garanzia"
0

SLIDER
17
850
219
883
BudgetRegione
BudgetRegione
0.1
15
5
0.1
1
milioni
HORIZONTAL

TEXTBOX
958
773
1108
791
Interazione sociale
14
105.0
1

SLIDER
958
804
1130
837
Raggio
Raggio
1
10
5
1
1
patches
HORIZONTAL

SWITCH
958
844
1061
877
Intorno
Intorno
0
1
-1000

SLIDER
17
890
189
923
Probfinanz
Probfinanz
0
100
90
1
1
%
HORIZONTAL

PLOT
428
793
831
983
Budget corrente
tempo
Fondi rimasti
0.0
10.0
0.0
10.0
true
true
"" ""
PENS
"Budget Corrente" 1.0 0 -16777216 true "" "plot BudgetCorrente"

BUTTON
858
841
922
874
NIL
Setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
858
803
921
836
NIL
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
0

MONITOR
450
1003
684
1048
Quanti hanno usufruito degli incentivi regionali
totreg
17
1
11

MONITOR
691
1003
856
1048
Percentuale di chi ha usufruito
percreg
17
1
11

TEXTBOX
158
811
262
829
Tipologia di incentivi
11
0.0
1

TEXTBOX
224
859
357
877
Quantità di risorse allocate
11
0.0
1

TEXTBOX
197
894
347
922
Probabilità del singolo agente di richiedere il finanziamento
11
0.0
1

TEXTBOX
1070
848
1220
876
Visualizzare sulla mappa il raggio di influenza
11
0.0
1

TEXTBOX
1136
804
1286
832
Raggio dentro cui un agente genera influenza
11
0.0
1

TEXTBOX
451
768
601
796
Il plot mostra l'andamento del budget allocato dalla regione
11
0.0
1

SLIDER
19
932
191
965
InterBanca
InterBanca
1
20
5
1
1
%
HORIZONTAL

TEXTBOX
197
939
347
957
Interesi che applica la banca
11
0.0
1

TEXTBOX
199
1020
349
1038
Interessi che applica la regione
11
0.0
1

SLIDER
20
1014
192
1047
InterRegione
InterRegione
1
20
1
1
1
%
HORIZONTAL

SLIDER
20
972
192
1005
Accettato
Accettato
1
100
85
1
1
%
HORIZONTAL

TEXTBOX
199
975
349
1003
Probalibiltà di poter accedere al mutuo in banca
11
0.0
1

SLIDER
20
1055
259
1088
Anni_Restituzione_mutuo_regione
Anni_Restituzione_mutuo_regione
1
30
20
1
1
NIL
HORIZONTAL

TEXTBOX
267
1057
417
1085
Quante rate di pagamaneto impone la regione
11
0.0
1

SLIDER
22
1095
259
1128
Anni_Restituzione_mutuo_banca
Anni_Restituzione_mutuo_banca
1
30
20
1
1
NIL
HORIZONTAL

TEXTBOX
269
1099
419
1127
Quante rate di pagamento impone la banca
11
0.0
1

SLIDER
22
1137
194
1170
FallimentoMutuo
FallimentoMutuo
0
100
10
1
1
%
HORIZONTAL

TEXTBOX
202
1139
352
1167
Probabilità che un agente non riesca più a pagare il mutuo
11
0.0
1

MONITOR
451
1059
508
1104
NIL
r2012
17
1
11

MONITOR
517
1058
574
1103
NIL
r2013
17
1
11

MONITOR
582
1058
639
1103
NIL
r2014
17
1
11

MONITOR
649
1059
706
1104
NIL
r2015
17
1
11

MONITOR
714
1059
771
1104
NIL
r2016
17
1
11

TEXTBOX
452
1109
764
1129
Percentuali di quanti agenti hanno effettuato l'investimento
11
0.0
1

SLIDER
960
886
1132
919
Sensibilita
Sensibilita
0
5
2
0.1
1
NIL
HORIZONTAL

TEXTBOX
1141
884
1291
926
Quanto l'esempio dei vicini influenza l'agente che deve decidere sull'investimento
11
0.0
1

SLIDER
23
1178
195
1211
PercMin
PercMin
1
100
20
1
1
NIL
HORIZONTAL

SLIDER
24
1220
196
1253
PercMax
PercMax
10
100
80
1
1
NIL
HORIZONTAL

TEXTBOX
209
1221
448
1251
Percentuale massima dell'investimento che un agente può chiedere alla regione
11
0.0
1

TEXTBOX
207
1187
450
1215
Percentuale minima dell'investimento che un agente può chiedere alla regione
11
0.0
1

MONITOR
862
1004
960
1049
Scelta negativa
totdied
17
1
11

MONITOR
965
1004
1154
1049
Scelta negativa per fattori economici
totnegsoldi
17
1
11

MONITOR
968
1168
1230
1213
percentuale di scelte negative per fattori economici
perctotnegsoldi
17
1
11

MONITOR
497
1166
583
1211
NIL
percneg2012
17
1
11

MONITOR
591
1167
677
1212
NIL
percneg2013
17
1
11

MONITOR
685
1167
771
1212
NIL
percneg2014
17
1
11

MONITOR
780
1167
866
1212
NIL
percneg2015
17
1
11

MONITOR
874
1168
960
1213
NIL
percneg2016
17
1
11

TEXTBOX
499
1220
933
1239
Percentuale di quanti agenti nell'anno non hanno fatto l'investimento per motivi economici
11
0.0
1

BUTTON
859
880
925
913
NIL
default
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
25
1261
197
1294
InfluenzaRate
InfluenzaRate
1
100
40
1
1
NIL
HORIZONTAL

TEXTBOX
208
1264
358
1292
La presenza delle rate quanto influisce sulle scelte?
11
0.0
1

MONITOR
966
1058
1130
1103
Percentuale di scelte negative
percnegativa
17
1
11

MONITOR
967
1113
1130
1158
Percentuale di scelte positive
percpositive
17
1
11

SLIDER
1287
1028
1545
1061
BudgetRegione2013
BudgetRegione2013
0
10
0
0.1
1
milioni
HORIZONTAL

SLIDER
1285
1074
1543
1107
BudgetRegione2014
BudgetRegione2014
0
10
0
0.1
1
milioni
HORIZONTAL

SLIDER
1287
1124
1545
1157
BudgetRegione2015
BudgetRegione2015
0
10
0
0.1
1
milioni
HORIZONTAL

SLIDER
1287
1169
1545
1202
BudgetRegione2016
BudgetRegione2016
0
10
0
0.1
1
milioni
HORIZONTAL

PLOT
2154
792
2703
1077
kW_Installed
Years
kW
0.0
16.0
0.0
5000.0
false
false
"" ""
PENS
"kW" 1.0 1 -13345367 true "" "plot kw_installed_yearly"

SLIDER
1287
987
1545
1020
BudgetRegione2012
BudgetRegione2012
0
10
0
0.1
1
milioni
HORIZONTAL

SLIDER
1293
833
1547
866
BudgetRegione2008
BudgetRegione2008
0
10
0
0.1
1
milioni
HORIZONTAL

SLIDER
1289
874
1543
907
BudgetRegione2009
BudgetRegione2009
0
10
0
0.1
1
milioni
HORIZONTAL

SLIDER
1288
912
1542
945
BudgetRegione2010
BudgetRegione2010
0
10
0
0.1
1
milioni
HORIZONTAL

SLIDER
1287
950
1541
983
BudgetRegione2011
BudgetRegione2011
0
10
0
0.1
1
milioni
HORIZONTAL

BUTTON
1748
725
1821
758
NIL
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
1844
725
1917
758
NIL
go\n
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
0

MONITOR
1385
110
1509
155
kw INSTALLATI 2007
kW2007
17
1
11

MONITOR
1385
165
1508
210
kw INSTALLATI 2008
kW2008
17
1
11

MONITOR
1385
220
1511
265
kw INSTALLATI 2009
kW2009
17
1
11

MONITOR
1385
274
1512
319
kw INSTALLATI 2010
kW2010
17
1
11

MONITOR
1385
330
1512
375
kw INSTALLATI 2011
kW2011
17
1
11

MONITOR
1517
111
1717
156
INCENTIVI INSTALLAZIONE 2007
INCENTIVO_INST2007
2
1
11

MONITOR
1517
164
1719
209
INCENTIVI INSTALLAZIONE 2008
INCENTIVO_INST2008
2
1
11

MONITOR
1520
220
1722
265
INCENTIVI INSTALLAZIONE 2009
INCENTIVO_INST2009
2
1
11

MONITOR
1522
272
1723
317
INCENTIVI INSTALLAZIONE 2010
INCENTIVO_INST2010
2
1
11

MONITOR
1525
326
1723
371
INCENTIVI INSTALLAZIONE 2011
INCENTIVO_INST2011
2
1
11

MONITOR
1727
110
1868
155
INCENTIVI  2007
INCENTIVO_PRO2007
17
1
11

MONITOR
1728
163
1871
208
INCENTIVI  2008
INCENTIVO_PRO2008
17
1
11

MONITOR
1731
223
1873
268
INCENTIVI  2009
INCENTIVO_PRO2009
17
1
11

MONITOR
1732
274
1874
319
INCENTIVI  2010
INCENTIVO_PRO2010
17
1
11

MONITOR
1732
329
1876
374
INCENTIVI  2011
INCENTIVO_PRO2011
17
1
11

MONITOR
1894
328
2019
373
TOTALE SPESA 2011
TOT_SPESA2011
17
1
11

MONITOR
1892
275
2018
320
TOTALE SPESA 2010
TOT_SPESA2010
17
1
11

MONITOR
1889
223
2018
268
TOTALE SPESA 2009
TOT_SPESA2009
17
1
11

MONITOR
1890
166
2016
211
TOTALE SPESA 2008
TOT_SPESA2008
17
1
11

MONITOR
1889
111
2016
156
TOTALE SPESA 2007
TOT_SPESA2007
17
1
11

PLOT
1560
791
2146
1076
kW_installed_bars
NIL
NIL
2007.0
2014.0
0.0
5000.0
true
false
"" ""
PENS
"2007" 1.0 1 -11033397 true "" ""
"2008" 1.0 1 -2674135 true "" ""
"2009" 1.0 1 -955883 true "" ""
"2010" 1.0 1 -6459832 true "" ""
"2011" 1.0 1 -1184463 true "" ""
"2012" 1.0 1 -10899396 true "" ""
"2013" 1.0 1 -1664597 true "" ""

MONITOR
1654
1089
1767
1134
kW Secondo CE
kW_2CE
17
1
11

MONITOR
1655
1141
1767
1186
kW Terzo CE
kW_3CE
17
1
11

MONITOR
1656
1193
1768
1238
kW Quarto CE
kW_4CE
17
1
11

MONITOR
1655
1242
1768
1287
kW Quinto CE
kW_5CE
17
1
11

MONITOR
1774
1090
1924
1135
kW Secondo CE 2007
kW_2CE_2007
17
1
11

MONITOR
1934
1090
2084
1135
kW Secondo CE 2008
kW_2CE_2008
17
1
11

MONITOR
2091
1091
2241
1136
kW Secondo CE 2009
kW_2CE_2009
17
1
11

MONITOR
2249
1092
2399
1137
kW Secondo CE 2010
kW_2CE_2010
17
1
11

MONITOR
2409
1093
2559
1138
kW Secondo CE 2011
kW_2CE_2011
17
1
11

MONITOR
1776
1141
1924
1186
kW Terzo CE 2011
kW_3CE_2011
17
1
11

MONITOR
1777
1194
1924
1239
kW Quarto CE 2011
kW_4CE_2011
17
1
11

MONITOR
1933
1193
2084
1238
kW Quarto CE 2012
kW_4CE_2012
17
1
11

MONITOR
1775
1243
1923
1288
kW Quinto CE 2012
kW_5CE_2012
17
1
11

MONITOR
1932
1244
2085
1289
kW Quinto CE 2013
kW_5CE_2013
17
1
11

MONITOR
1656
1300
1768
1345
NIL
kW_1FP
17
1
11

MONITOR
1776
1301
1923
1346
NIL
kW_2FP
17
1
11

MONITOR
1934
1301
2083
1346
NIL
kW_3FP
17
1
11

MONITOR
1655
1354
1768
1399
NIL
kW_4FP
17
1
11

MONITOR
1777
1353
1923
1398
NIL
kW_5FP
17
1
11

MONITOR
1933
1354
2084
1399
NIL
kW_6FP
17
1
11

BUTTON
1563
1224
1636
1257
NIL
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
1563
1268
1626
1301
NIL
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
0

MONITOR
1655
1413
1769
1458
NIL
count_pf_1FP
17
1
11

MONITOR
1779
1414
1922
1459
NIL
count_pf_2FP
17
1
11

MONITOR
1932
1415
2081
1460
NIL
count_pf_3FP
17
1
11

MONITOR
1654
1465
1770
1510
NIL
count_pf_4FP
17
1
11

MONITOR
1779
1466
1922
1511
NIL
count_pf_5FP
17
1
11

MONITOR
1929
1466
2084
1511
NIL
count_pf_6FP
17
1
11

PLOT
2125
1162
2692
1530
KW_istalled_power_class
Years
kW
0.0
16.0
0.0
10000.0
false
false
"" ""
PENS
"fascia1" 1.0 1 -13791810 true "" "plot kW_1FP"
"fascia2" 1.0 1 -955883 true "" "plot kW_2FP"
"fascia3" 1.0 1 -2674135 true "" "plot kW_3FP"
"fascia4" 1.0 1 -6459832 true "" "plot kW_4FP"
"fascia5" 1.0 1 -13840069 true "" "plot kW_5FP"
"fascia6" 1.0 1 -8630108 true "" "plot kW_6FP"

MONITOR
1398
1258
1483
1303
NIL
morti_FP_1
17
1
11

MONITOR
1397
1311
1482
1356
NIL
morti_FP_2
17
1
11

MONITOR
1397
1362
1482
1407
NIL
morti_FP_3
17
1
11

MONITOR
1397
1412
1482
1457
NIL
morti_FP_4
17
1
11

MONITOR
1397
1462
1482
1507
NIL
morti_FP_5
17
1
11

MONITOR
1397
1510
1482
1555
NIL
morti_FP_6
17
1
11

MONITOR
373
1368
446
1413
NIL
rand_FP2
17
1
11

MONITOR
373
1316
446
1361
NIL
rand_FP1
17
1
11

MONITOR
371
1420
444
1465
NIL
rand_FP3
17
1
11

MONITOR
371
1471
444
1516
NIL
rand_FP4
17
1
11

MONITOR
370
1518
443
1563
NIL
rand_FP5
17
1
11

MONITOR
371
1565
444
1610
NIL
rand_FP6
17
1
11

MONITOR
1277
1253
1378
1298
NIL
count_pf_2CE
17
1
11

MONITOR
1276
1305
1377
1350
NIL
count_pf_3CE
17
1
11

MONITOR
1275
1357
1376
1402
NIL
count_pf_4CE
17
1
11

MONITOR
1277
1405
1378
1450
NIL
count_pf_5CE
17
1
11

PLOT
1565
1523
2114
1876
kW_installed_semester
Semesters
kW
0.0
15.0
0.0
3000.0
false
false
"" ""
PENS
"default" 1.0 1 -13840069 true "" "plot kw_installed_semester"

TEXTBOX
1113
405
1263
423
Return On Equity
14
63.0
1

SLIDER
1103
432
1331
465
ROE_minimo_desiderato
ROE_minimo_desiderato
1
20
5
1
1
NIL
HORIZONTAL

TEXTBOX
1265
1221
1415
1239
Num. agenti per CE
12
15.0
1

TEXTBOX
1397
1220
1547
1250
Num. agenti \nmorti per FP
12
15.0
1

TEXTBOX
352
1259
502
1304
Generazione agenti random,\n numero per FP
12
15.0
1

TEXTBOX
918
1509
1068
1527
Agenti morti causa ROE
12
95.0
1

MONITOR
942
1530
1034
1575
NIL
totnegroe
17
1
11

TEXTBOX
923
1217
1073
1247
Agenti morti causa ROE, per anno
12
95.0
1

MONITOR
849
1252
965
1297
NIL
totneg_roe2007
17
1
11

MONITOR
849
1303
965
1348
NIL
totneg_roe2008
17
1
11

MONITOR
849
1353
965
1398
NIL
totneg_roe2009
17
1
11

MONITOR
849
1403
965
1448
NIL
totneg_roe2010
17
1
11

MONITOR
850
1453
966
1498
NIL
totneg_roe2011
17
1
11

MONITOR
972
1252
1088
1297
NIL
totneg_roe2012
17
1
11

MONITOR
972
1303
1088
1348
NIL
totneg_roe2013
17
1
11

MONITOR
973
1353
1089
1398
NIL
totneg_roe2014
17
1
11

MONITOR
973
1403
1089
1448
NIL
totneg_roe2015
17
1
11

MONITOR
972
1453
1088
1498
NIL
totneg_roe2016
17
1
11

TEXTBOX
1108
1222
1258
1240
Num. agenti per anno
12
44.0
1

MONITOR
1125
1252
1226
1297
NIL
count_pf2007
17
1
11

MONITOR
1125
1303
1226
1348
NIL
count_pf2008
17
1
11

MONITOR
1126
1352
1227
1397
NIL
count_pf2009
17
1
11

MONITOR
1126
1402
1227
1447
NIL
count_pf2010
17
1
11

MONITOR
1127
1452
1228
1497
NIL
count_pf2011
17
1
11

MONITOR
1127
1502
1228
1547
NIL
count_pf2012
17
1
11

MONITOR
1126
1552
1227
1597
NIL
count_pf2013
17
1
11

TEXTBOX
297
663
447
723
I prezzi dell'energia al consumo non sono più selezionabili tramite interfaccia
12
24.0
1

TEXTBOX
1114
486
1264
520
Diffusione Conoscenza Iniziale
14
112.0
1

SLIDER
1105
532
1346
565
Diffusione_Conoscenza_Iniziale
Diffusione_Conoscenza_Iniziale
0
100
1
1
1
NIL
HORIZONTAL

TEXTBOX
595
1243
745
1273
Agenti morti causa mancanza conoscenza
12
33.0
1

MONITOR
489
1288
659
1333
NIL
morti_conoscenza_2007
17
1
11

MONITOR
489
1340
659
1385
NIL
morti_conoscenza_2008
17
1
11

MONITOR
489
1390
659
1435
NIL
morti_conoscenza_2009
17
1
11

MONITOR
488
1440
658
1485
NIL
morti_conoscenza_2010
17
1
11

MONITOR
489
1491
659
1536
NIL
morti_conoscenza_2011
17
1
11

MONITOR
664
1288
834
1333
NIL
morti_conoscenza_2012
17
1
11

MONITOR
664
1340
834
1385
NIL
morti_conoscenza_2013
17
1
11

MONITOR
665
1391
835
1436
NIL
morti_conoscenza_2014
17
1
11

MONITOR
665
1441
835
1486
NIL
morti_conoscenza_2015
17
1
11

MONITOR
667
1491
837
1536
NIL
morti_conoscenza_2016
17
1
11

CHOOSER
1106
572
1347
617
Tipo_variazione_conoscenza_PV
Tipo_variazione_conoscenza_PV
"Lineare" "Quadratico" "Cubico"
1

SLIDER
1106
621
1348
654
Coeff_Variazione_Diffusione
Coeff_Variazione_Diffusione
1
10
1
0.1
1
NIL
HORIZONTAL

@#$#@#$#@
## CREDITS AND REFERENCES

Croce Luca crocelu@libero.it

Andrea Borghesi ndr.borghesi@gmail.com
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
0
Rectangle -7500403 true true 151 225 180 285
Rectangle -7500403 true true 47 225 75 285
Rectangle -7500403 true true 15 75 210 225
Circle -7500403 true true 135 75 150
Circle -16777216 true false 165 76 116

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

sun
false
0
Circle -7500403 true true 75 75 150
Polygon -7500403 true true 300 150 240 120 240 180
Polygon -7500403 true true 150 0 120 60 180 60
Polygon -7500403 true true 150 300 120 240 180 240
Polygon -7500403 true true 0 150 60 120 60 180
Polygon -7500403 true true 60 195 105 240 45 255
Polygon -7500403 true true 60 105 105 60 45 45
Polygon -7500403 true true 195 60 240 105 255 45
Polygon -7500403 true true 240 195 195 240 255 255

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270

@#$#@#$#@
NetLogo 5.0.2
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
<experiments>
  <experiment name="kW_installed_yearly_CE" repetitions="100" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <enumeratedValueSet variable="NumeroAgenti">
      <value value="200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Tasso_lordo_rendimento_BOT">
      <value value="2.147"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Manutenzione_anno_%costo_totale">
      <value value="1.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Media%_copertura_consumi_richiesta">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="M2_Disposizione">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="%_Incentivi_Installazione">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="%_Variazione_Tariffe">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="PercMax">
      <value value="80"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2011">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Costo_Medio_kwP">
      <value value="3500"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Accettato">
      <value value="85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Probfinanz">
      <value value="90"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="LeggiSerieStoriche">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Tecnologia_Pannello">
      <value value="&quot;Monocristallini&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="InfluenzaRate">
      <value value="40"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2013">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Consumo_medio_annuale_KWh">
      <value value="15200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="costo_kwh_fascia2">
      <value value="0.162"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2008">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Percentuale_Interessi_Prestito">
      <value value="4.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Incentivi_Dinamici">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="costo_kwh_fascia1">
      <value value="0.278"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Sensibilita">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Raggio">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="InterBanca">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2012">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Varia_Tariffe_Incetivanti">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="costo_kwh_fascia4">
      <value value="0.246"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2010">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="costo_kwh_fascia5">
      <value value="0.276"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="fr">
      <value value="&quot;Nessuno&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Budget_Medio_MiliaiaEuro">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Riduzione_anno_%costo_pannello">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="PercMin">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2009">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Incentivi_Installazione">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Perdita_efficienza_annuale_pannello">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Anni_Restituzione_Prestiti">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Anni_Restituzione_mutuo_banca">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="FallimentoMutuo">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Anni_Restituzione_mutuo_regione">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2015">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="costo_kwh_fascia3">
      <value value="0.194"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Irradiazione_media_annua_kwh_kwp">
      <value value="1350"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="InterRegione">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2016">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="variazione_annuale_prezzi_elettricita">
      <value value="1.8"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Intorno">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2014">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Aumento_%annuo_consumi">
      <value value="0.9"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="kW_installed_yearly_condizioni_sfav" repetitions="500" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <enumeratedValueSet variable="Tasso_lordo_rendimento_BOT">
      <value value="2.147"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2011">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Incentivi_Installazione">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="PercMax">
      <value value="80"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2010">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Manutenzione_anno_%costo_totale">
      <value value="1.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="FallimentoMutuo">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Budget_Medio_MiliaiaEuro">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Anni_Restituzione_mutuo_regione">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2008">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="PercMin">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="InterBanca">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2015">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Irradiazione_media_annua_kwh_kwp">
      <value value="1350"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="costo_kwh_fascia4">
      <value value="0.246"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Percentuale_Interessi_Prestito">
      <value value="4.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="fr">
      <value value="&quot;Nessuno&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Anni_Restituzione_mutuo_banca">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="costo_kwh_fascia3">
      <value value="0.194"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="variazione_annuale_prezzi_elettricita">
      <value value="1.8"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="%_Variazione_Tariffe">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="%_Incentivi_Installazione">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Varia_Tariffe_Incetivanti">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Incentivi_Dinamici">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="LeggiSerieStoriche">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Sensibilita">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2016">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Indice_condizioni_sfavorevoli">
      <value value="7.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="costo_kwh_fascia5">
      <value value="0.276"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2012">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Raggio">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Perdita_efficienza_annuale_pannello">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Media%_copertura_consumi_richiesta">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Riduzione_anno_%costo_pannello">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Anni_Restituzione_Prestiti">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Variazione_annuale_condizioni">
      <value value="0.1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="InfluenzaRate">
      <value value="40"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="M2_Disposizione">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2014">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="costo_kwh_fascia2">
      <value value="0.162"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Consumo_medio_annuale_KWh">
      <value value="15200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Aumento_%annuo_consumi">
      <value value="0.9"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="NumeroAgenti">
      <value value="200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="ROE_minimo_desiderato">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Intorno">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="costo_kwh_fascia1">
      <value value="0.278"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="InterRegione">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Probfinanz">
      <value value="90"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Costo_Medio_kwP">
      <value value="4300"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Tecnologia_Pannello">
      <value value="&quot;Monocristallini&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Accettato">
      <value value="85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2013">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2009">
      <value value="0"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="kw_influenza_ROE_minimo" repetitions="100" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <enumeratedValueSet variable="Intorno">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="costo_kwh_fascia4">
      <value value="0.246"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Tasso_lordo_rendimento_BOT">
      <value value="2.147"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Tecnologia_Pannello">
      <value value="&quot;Monocristallini&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2016">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2011">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="InterBanca">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Irradiazione_media_annua_kwh_kwp">
      <value value="1350"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Media%_copertura_consumi_richiesta">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="M2_Disposizione">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="LeggiSerieStoriche">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="InfluenzaRate">
      <value value="40"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2013">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="fr">
      <value value="&quot;Nessuno&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Anni_Restituzione_mutuo_regione">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Riduzione_anno_%costo_pannello">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Incentivi_Dinamici">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Aumento_%annuo_consumi">
      <value value="0.9"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Consumo_medio_annuale_KWh">
      <value value="15200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="%_Variazione_Tariffe">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="InterRegione">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Perdita_efficienza_annuale_pannello">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2014">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2010">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="variazione_annuale_prezzi_elettricita">
      <value value="1.8"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Probfinanz">
      <value value="90"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2015">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Sensibilita">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Manutenzione_anno_%costo_totale">
      <value value="1.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="NumeroAgenti">
      <value value="200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Anni_Restituzione_Prestiti">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Accettato">
      <value value="85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="PercMax">
      <value value="80"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="ROE_minimo_desiderato">
      <value value="1"/>
      <value value="3"/>
      <value value="5"/>
      <value value="7"/>
      <value value="10"/>
      <value value="12"/>
      <value value="14"/>
      <value value="15"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="%_Incentivi_Installazione">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="FallimentoMutuo">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Costo_Medio_kwP">
      <value value="4300"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Incentivi_Installazione">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Varia_Tariffe_Incetivanti">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="costo_kwh_fascia2">
      <value value="0.162"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="costo_kwh_fascia5">
      <value value="0.276"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Percentuale_Interessi_Prestito">
      <value value="4.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2009">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="PercMin">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="costo_kwh_fascia3">
      <value value="0.194"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Budget_Medio_MiliaiaEuro">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Anni_Restituzione_mutuo_banca">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="costo_kwh_fascia1">
      <value value="0.278"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Raggio">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2008">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2012">
      <value value="0"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="kw_installati_conoscenza" repetitions="100" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <enumeratedValueSet variable="Costo_Medio_kwP">
      <value value="3500"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Raggio">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Media%_copertura_consumi_richiesta">
      <value value="70"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="%_Incentivi_Installazione">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Diffusione_Conoscenza_Iniziale">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="%_Variazione_Tariffe">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Sensibilita">
      <value value="2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2008">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="fr">
      <value value="&quot;Nessuno&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="InterBanca">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Accettato">
      <value value="85"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="M2_Disposizione">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Tecnologia_Pannello">
      <value value="&quot;Monocristallini&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="variazione_annuale_prezzi_elettricita">
      <value value="1.8"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Intorno">
      <value value="true"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Tasso_lordo_rendimento_BOT">
      <value value="2.147"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2011">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="InterRegione">
      <value value="1"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Tipo_variazione_conoscenza_PV">
      <value value="&quot;Cubico&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2012">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="costo_kwh_fascia3">
      <value value="0.194"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Anni_Restituzione_mutuo_regione">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Incentivi_Installazione">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2013">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="costo_kwh_fascia5">
      <value value="0.276"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Percentuale_Interessi_Prestito">
      <value value="4.3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="LeggiSerieStoriche">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2014">
      <value value="0"/>
    </enumeratedValueSet>
    <steppedValueSet variable="Coeff_Variazione_Diffusione" first="1" step="0.5" last="5.5"/>
    <enumeratedValueSet variable="BudgetRegione2010">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Manutenzione_anno_%costo_totale">
      <value value="1.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="PercMin">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Budget_Medio_MiliaiaEuro">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Perdita_efficienza_annuale_pannello">
      <value value="0.5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Anni_Restituzione_Prestiti">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="costo_kwh_fascia4">
      <value value="0.246"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="PercMax">
      <value value="80"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Consumo_medio_annuale_KWh">
      <value value="15200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="InfluenzaRate">
      <value value="40"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2015">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="NumeroAgenti">
      <value value="200"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="ROE_minimo_desiderato">
      <value value="5"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Riduzione_anno_%costo_pannello">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="FallimentoMutuo">
      <value value="10"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Incentivi_Dinamici">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Probfinanz">
      <value value="90"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Anni_Restituzione_mutuo_banca">
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Varia_Tariffe_Incetivanti">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="costo_kwh_fascia2">
      <value value="0.162"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2009">
      <value value="0"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Aumento_%annuo_consumi">
      <value value="0.9"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Irradiazione_media_annua_kwh_kwp">
      <value value="1350"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="costo_kwh_fascia1">
      <value value="0.278"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="BudgetRegione2016">
      <value value="0"/>
    </enumeratedValueSet>
  </experiment>
</experiments>
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 1.0 0.0
0.0 1 1.0 0.0
0.2 0 1.0 0.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180

@#$#@#$#@
0
@#$#@#$#@
