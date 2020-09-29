remote_host = cloud
remote_dir = ~/sites/stats/public_html/who-cares-about-crackdowns
remote_dest = $(remote_host):$(remote_dir)

.PHONY: clean html upload serve

serve:
	Rscript -e "servr::httw(dir = '_site', port = 7000)"

html:
	Rscript -e "rmarkdown::render_site(encoding = 'UTF-8')"

clean:
	Rscript -e "rmarkdown::clean_site()"

upload:
	rsync -crvP --delete _site/ $(remote_dest)
