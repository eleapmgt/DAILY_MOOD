import { Controller } from "@hotwired/stimulus"
import * as bootstrap from 'bootstrap'
export default class extends Controller {
  static targets = ["canvas", "reward"]
  static values = {image: String, id: String}
  connect() {
    console.log(this.canvasTarget)
    this.ctx = this.canvasTarget.getContext('2d');
    this.img = new Image();
    //  this.img.onload = this.roll.bind(this);
    this.img.src = this.imageValue;
    this.img.onload = this.drawImg.bind(this)
    // console.log(this.ctx);
    // console.log(this.img);
  }

  drawImg() {
    this.ctx.drawImage(this.img, 0, 0, 250, 250);
  }

  run() {
    const count = document.querySelector("#count")
    console.log(count)
    const n = Number(count.innerText)
    this.ctx.clearRect(0, 0, this.canvasTarget.width, this.canvasTarget.height);
    const delta = 200 / n * 360* 3 * Math.PI / 180;
    this.ctx.translate(125, 125);
    this.ctx.rotate(delta);
    this.ctx.drawImage(this.img, -125, -125, 250, 250);
    // this.ctx.fillRect(0,0,30,30);
    this.ctx.setTransform(1, 0, 0, 1, 0, 0);
    count.innerText = n + 1
    if (n > 500) {
      this.initializeRewards()
      clearInterval(this.interval); // If exceeded 100, clear interval
    }

  }

  roll() {
    this.interval = setInterval(this.run.bind(this), 10);
  }

  initializeRewards() {
    console.log('hello')
    const rewards = ["musique", "article", "citation", "video"]
    const reward = rewards[Math.floor(Math.random() * rewards.length)];
    const url = `/diaries/${this.idValue}/diaries_rewards?category=${reward}`
    fetch(url, {
      method: "POST",
      headers: { "Accept": 'text/plain', 'Content': "application/json" }
    })
      .then(response => response.text())
      .then((data) => {
        this.rewardTarget.innerHTML = data
        const myModal = new bootstrap.Modal('#modalReward', {
          show: false
        })
        myModal.show()
      })
  }


 }
