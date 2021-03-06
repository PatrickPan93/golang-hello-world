package main

import (
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {

	router := gin.Default()

	router.GET("/", func(c *gin.Context) {

		c.String(http.StatusOK, "Hello World")

	})

	if err := router.Run(":8080"); err != nil {
		log.Println(err.Error())
	}

}
