interface Name {
  name: string
  age: number
}


const some: Name = {
  name: "I can learn anything ",
  age: 44
}

interface ChangerProps {
  item: string
  isChanged: boolean
}

interface Changer {
  item: string
  isChanged: boolean
  changeStatus(): void
}

class ChangerClass implements Changer {
  item: string
  isChanged: boolean
  constructor({ item, isChanged }: ChangerProps) {
    this.item = item
    this.isChanged = isChanged
  }
  changeStatus(): void {
    throw new Error("Method not implemented.")
  }


}

