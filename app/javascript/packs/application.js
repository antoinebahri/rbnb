import "bootstrap";

// MapBox
// CSS
import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

// import { calculateTotalPrice } from './calculate';

// calculateTotalPrice();
const form = document.querySelector('form')

form.addEventListener("change", event => {
  const startDateInput = document.querySelector('#start_date');
  const endDateInput = document.querySelector('#end_date');

  if (startDateInput.value !== "" && endDateInput.value !== "") {
  console.log(startDateInput.value);
  calculateTotalPrice(startDateInput, endDateInput);
}
});


const calculateTotalPrice = (start, end) => {
  console.log("start of the function")
  const endMilli = Date.parse(start.value)
  const startMilli = Date.parse(end.value)
  const diff = startMilli - endMilli
  const numberDays = diff/1000/60/60/24
  const price = document.querySelector('#total_price');
  const pricePerNight = Number(document.getElementById("price_night").innerText);
  console.log(pricePerNight);
  console.log(numberDays);
  const totalPrice = numberDays * pricePerNight
  price.innerHTML = `<h4>The total price of your stay is ${totalPrice} euros</h4>`
}
