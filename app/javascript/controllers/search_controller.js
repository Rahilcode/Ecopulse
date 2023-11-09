import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["name", "post", "location"];
  static value = { posts: Array };

  connect() {
    console.log("Working", this.element);
    this.postsValue = this.postTargets;
  }

  filterPosts(event) {
    let value = event.target.value.toLowerCase().trim();
    // console.log(this.postTargets);
    this.postsValue.forEach((element, index) => {
      let name = this.nameTargets[index].innerText.toLowerCase();

      if (name.includes(value)) {
        element.classList.remove("d-none");
      } else {
        element.classList.add("d-none");
      }
    });
  }

  filter(event) {
    let value = event.target.value.toLowerCase().trim();
    // console.log(this.postTargets);
    this.postsValue.forEach((element, index) => {
      let name = this.nameTargets[index].innerText.toLowerCase();
      let searchVal = this.postsValue[index].innerText
        .split("\n")[0]
        .toLowerCase()
        .trim();

      if (searchVal.includes(value)) {
        console.log("remove");
        element.classList.remove("d-none");
      } else {
        console.log("add");
        element.classList.add("d-none");
      }
      console.log(searchVal + value + element);
      console.log(this.postsValue, searchVal);
    });
  }

  selectFilter(event) {
    console.log(event.target.value);
    let val = event.target.value.toLowerCase().trim();

    let c = 0;
    let tempArray = [];
    this.postTargets.forEach((element, index) => {
      let cities = this.locationTargets[index].children;

      // let flag = false;

      let city = cities[0].innerText.toLowerCase().trim();
      console.log(city);
      if (city == val) {
        console.log(city, val);
        console.log("true");
        element.classList.remove("d-none");
        tempArray.push(element);
      } else {
        element.classList.add("d-none");
        console.log("false");
      }

      // If there are more than one city
      // for (let i = 0; i < cities.length; i++) {
      //   let city = cities[i].innerText.toLowerCase();

      //   if (city == val) {
      //     console.log(city, val);
      //     flag = true;
      //     c++;
      //     break;
      //   } else {
      //     console.log("false");
      //     flag = false;
      //   }
      // }

      // if (flag) {
      //   element.classList.remove("d-none");
      //   tempArray.push(element);
      // } else {
      //   element.classList.add("d-none");
      // }

      console.log(cities);
    });

    if (c == 0 && val == "all") {
      this.postsValue = this.postTargets;
      this.postTargets.forEach((ele) => {
        ele.classList.remove("d-none");
      });
    } else {
      console.log(tempArray);
      this.postsValue = tempArray;
    }
  }
}
