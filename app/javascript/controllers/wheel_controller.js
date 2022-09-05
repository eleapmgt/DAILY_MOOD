import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["canvas"]
  connect() {
    this.ctx = this.canvasTarget.getContext('2d');
    this.img = new Image();
    //  this.img.onload = this.roll.bind(this);
    this.img.src = 'https://assets.piliapp.com/s3lnk/random/wheel/screenshot.png';
    this.img.onload = this.drawImg.bind(this)
    console.log(this.ctx);
    console.log(this.img);
  }

  drawImg() {
    this.ctx.drawImage(this.img, -5, -5, 150, 150);
  }

  run () {
    const count = document.querySelector("#count")
    const n = Number(count.innerText)
    this.ctx.clearRect(0, 0, this.canvasTarget.width, this.canvasTarget.height);
    const delta = 200 / n * 360* 3 * Math.PI / 180;
    this.ctx.translate(70, 70);
    this.ctx.rotate(delta);
    this.ctx.drawImage(this.img, -75, -75, 150, 150);
    // this.ctx.fillRect(0,0,30,30);
    this.ctx.setTransform(1, 0, 0, 1, 0, 0);
    count.innerText = n + 1
    if (n > 1000) {
        clearInterval(this.interval); // If exceeded 100, clear interval
    }
  }

  roll () {
    this.interval = setInterval(this.run.bind(this), 10);
  }


}
