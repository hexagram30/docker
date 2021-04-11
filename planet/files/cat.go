package main	

import (
  "fmt"
  "io/ioutil"
  "os"
)

func main () {
  switch len(os.Args) {
  case 1:
    fmt.Println("Requires filename as input.")
    os.Exit(1)
  case 2:
    filename := os.Args[1]
    content, err := ioutil.ReadFile(filename)
    if err != nil {
      fmt.Println(err)
    }
    fmt.Print(string(content))
  default:
    fmt.Println("Too many arguments.")
    os.Exit(1)
  }
}
