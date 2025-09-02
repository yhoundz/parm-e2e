package main

import (
	"fmt"
	"runtime"
)

func main() {
	fmt.Println("Hello. This is the parm-e2e test application.")
	fmt.Println("\nThe purpose of this application is to serve as an e2e test repository for the parm package manager.")
	fmt.Printf("You are currently running %s on the %s architecture.\n", runtime.GOOS, runtime.GOARCH)
	fmt.Println("\nGoodbye.")
}
