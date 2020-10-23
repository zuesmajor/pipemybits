package main

import (
	"html/template"
	"io/ioutil"
	"net/http"
)

var tpl *template.Template

func init() {
	tpl = template.Must(template.ParseGlob("templates/*"))
}

func main() {
	http.HandleFunc("/", index)
	http.Handle("/gallery/", http.StripPrefix("/gallery", http.FileServer(http.Dir("./gallery"))))
	http.ListenAndServe(":8080", nil)
}

func index(w http.ResponseWriter, req *http.Request) {

	dirRead, _ := ioutil.ReadDir("gallery/")
	var imageNames = make([]string, len(dirRead))

	for i, img := range dirRead {
		// Present files to html
		imageNames[i] = "gallery/" + img.Name()
	}

	tpl.ExecuteTemplate(w, "index.gohtml", imageNames)
}
