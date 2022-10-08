WORTE =	worte.txt verben.txt adjektive.txt klein.txt \
	geographie.txt vornamen.txt abkuerz.txt imperat.txt latein.txt \
	informatik.txt infoabk.txt

deutsch.hash: all.words deutsch.aff
	buildhash all.words deutsch.aff $@
 
all.words: $(WORTE)
	sort -u $+ > $@

clean:
	rm -f all.words all.words.cnt all.words.stat deutsch.hash hk*deutsch.tar.gz

sort:
	for i in *.txt;do sort -u -o $$i $$i;done

dist:	clean sort
	tar cvf - * | gzip -9 > hk2-deutsch.tar.gz
