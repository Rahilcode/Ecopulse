import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["name", "post", "location", "price", "rating"];
  static value = { posts: Array, loc: String, price: String, rating: String };

  connect() {
    console.log("Working", this.element);
    this.postsValue = this.postTargets;
    this.locValue = "none";
    this.priceValue = "none";
    this.ratingValue = "none";
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
    this.locValue = val;

    window.location.replace(
      "http://localhost:3000/search/services/" +
        this.locValue +
        "/" +
        this.priceValue +
        "/" +
        this.ratingValue
    );
    return;

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

  priceFilter(event) {
    console.log(event.target.value);
    let val = event.target.value.toLowerCase().trim();

    this.priceValue = val;
    window.location.replace(
      "http://localhost:3000/search/services/" +
        this.locValue +
        "/" +
        this.priceValue +
        "/" +
        this.ratingValue
    );
    return;

    let c = 0;
    let tempArray = [];
    this.postTargets.forEach((element, index) => {
      let price = this.priceTargets[index].children[0].innerText
        .split(" ")[1]
        .toLowerCase()
        .trim();

      if (val == "1") {
        if (price >= 0 && price <= 99) {
          element.classList.remove("d-none");
          tempArray.push(element);
        } else {
          element.classList.add("d-none");
        }
      } else if (val == "2") {
        if (price >= 100 && price <= 299) {
          element.classList.remove("d-none");
          tempArray.push(element);
        } else {
          element.classList.add("d-none");
        }
      } else if (val == "3") {
        if (price >= 300 && price <= 599) {
          element.classList.remove("d-none");
          tempArray.push(element);
        } else {
          element.classList.add("d-none");
        }
      } else if (val == "4") {
        if (price >= 600) {
          element.classList.remove("d-none");
          tempArray.push(element);
        } else {
          element.classList.add("d-none");
        }
      } else {
        element.classList.remove("d-none");
      }

      // if (c == 0 && val == "all") {
      //   this.postsValue = this.postTargets;
      //   this.postTargets.forEach((ele) => {
      //     ele.classList.remove("d-none");
      //   });
      // } else {
      //   this.postsValue = tempArray;
      // }

      console.log(price);
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

  ratingFilter(event) {
    console.log(event.target.value);
    let val = event.target.value.toLowerCase().trim();

    let c = 0;
    let tempArray = [];
    this.postTargets.forEach((element, index) => {
      let rating = this.ratingTargets[index].innerText.toLowerCase().trim();

      if (val == "3") {
        if (rating == "3") {
          element.classList.remove("d-none");
          tempArray.push(element);
        } else {
          element.classList.add("d-none");
        }
      } else if (val == "4") {
        if (rating == 4) {
          element.classList.remove("d-none");
          tempArray.push(element);
        } else {
          element.classList.add("d-none");
        }
      } else if (val == "5") {
        if (rating == 5) {
          element.classList.remove("d-none");
          tempArray.push(element);
        } else {
          element.classList.add("d-none");
        }
      } else {
        element.classList.remove("d-none");
      }

      // if (c == 0 && val == "all") {
      //   this.postsValue = this.postTargets;
      //   this.postTargets.forEach((ele) => {
      //     ele.classList.remove("d-none");
      //   });
      // } else {
      //   this.postsValue = tempArray;
      // }

      console.log(rating);
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
