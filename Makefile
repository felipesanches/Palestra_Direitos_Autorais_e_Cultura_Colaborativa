INKSCAPE = inkscape
GHOSTSCRIPT = gs

SLIDES = 00_INTRO.pdf \
         01_Direitos_Autorais.pdf \
         02_Mickey.pdf \
         03_Lessig.pdf \
         04_Creative_Commons.pdf \
         05_Creative_Commons_Como_Usar.pdf \
         06_Compara_CC.pdf \
         07_Busca_Flickr.pdf \
         08_New_Old_Stock.pdf \
         09_New_Old_Stock_Exemplo.pdf \
         10_YouTube_Flickr_Como_Usar.pdf \
         11_Creditar_Texto.pdf \
         14_Wikipedia.pdf \
         18_Obrigado.pdf

#         12_Para_a_Web.pdf \
#         13_Wikis_Edicao_Colaborativa.pdf \
#         15_Perguntas.pdf \
#         16_Atividade1_Conta.pdf \
#         17_Atividade2_Pagina.pdf \

        
PDF = Direitos_Autorais_e_Cultura_Colaborativa.pdf

all: $(PDF)

clean:
	rm -rf $(SLIDES)
	rm $(PDF)

%.pdf: %.svg
	$(INKSCAPE) -f $< --export-pdf=$@

$(PDF): $(SLIDES)
	$(GHOSTSCRIPT) -q -sPAPERSIZE=letter -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=$(PDF) $(SLIDES)
	evince $(PDF)
