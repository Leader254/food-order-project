// javascript map
    
// var mymap = L.map('mapid').setView([-0.5648515, 37.3121506], 13);

// L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
//   attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/#map=13/-0.5654/37.3118/">OpenStreetMap</a> contributors',
//   maxZoom: 18
// }).addTo(mymap);
// Create the map
var mymap = L.map('mapid').setView([-0.5648515, 37.3121506], 13);

// Add the tile layer to the map
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/#map=13/-0.5654/37.3118/">OpenStreetMap</a> contributors',
  maxZoom: 18
}).addTo(mymap);

// Add a marker to show the current location
var locationMarker = L.marker([0, 0], {
  icon: L.icon({
    iconUrl: 'https://icons8.com/icon/2436/place-marker',
    iconSize: [35, 45],
    iconAnchor: [17, 42]
  })
}).addTo(mymap);

// Get the current location and update the marker
navigator.geolocation.getCurrentPosition(function(position) {
  locationMarker.setLatLng([position.coords.latitude, position.coords.longitude]);
  mymap.setView([position.coords.latitude, position.coords.longitude], 13);
});



// // getting the element form
// const form = document.getElementById('myForm');

// // get the form elements for validation
// const username = form.elements['username'];
// const firstname = form.elements['firstname'];
// const lastname = form.elements['lastname'];
// const email = form.elements['email'];
// const phone = form.elements['phone'];
// const password = form.elements['password'];
// const cpassword = form.elements['cpassword'];
// const address = form.elements['address'];

// // Add an event listener to the form submit event
// form.addEventListener('submit', (event)=> {

// // prevent the form from submitting
// event.preventDefault();
// // By using trim() before validating user input, we can help 
// // prevent false negatives in our validation logic, where valid 
// // input might be rejected due to the presence of extra whitespace characters.
// let isValid = true;


// if(username.value.trim() === '') {
//     username.classList.add('is-invalid');
//     isValid = false;
// } else {
//     username.classList.remove('is-invalid');
// }
// if(firstname.value.trim() === ''){
//     firstname.classList.add('is-invalid');
//     isValid = false;
// }else{
//     firstname.classList.remove('is-invalid');
// }
// if(lastname.value.trim() === ''){
//     lastname.classList.add('is-invalid');
//     isValid = false;
// }else{
//     lastname.classList.remove('is-invalid');
// }
// if(email.value.trim() === ''|| !email.value.includes('@')){
//     email.classList.add('is-invalid');
//     isValid = false;
// }else{
//     email.classList.remove('is-invalid');
// }
// if(phone.value.trim() === '' || !/^[0-9]{10}$/.test(phone.value)){
//     phone.classList.add('is-invalid');
//     isValid = false;
// }else{
//     phone.classList.remove('is-invalid');
// }
// password.setCustomValidity('');
// if(password.value.trim() === ''){
//     password.classList.add('is-invalid');
//     isValid = false;
// }
// else if (password.value.length < 8 || !/[A-Z]/.test(password.value) || !/[a-z]/.test(password.value) || !/[0-9]/.test(password.value) || !/[\W_]/.test(password.value)) {
//         password.classList.add('is-invalid');
//         password.setCustomValidity('Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character.');
//         isValid = false;
// } else {
//         password.classList.remove('is-invalid');
//         password.setCustomValidity('');
// }
// if (cpassword.value.trim() === '' || cpassword.value !== password.value) {
//     cpassword.classList.add('is-invalid');
//     isValid = false;
//   } else {
//     cpassword.classList.remove('is-invalid');
//   }
//   if (address.value.trim() === '') {
//     address.classList.add('is-invalid');
//     isValid = false;
//   } else {
//     address.classList.remove('is-invalid');
//   }
//    // Submit the form if valid
//    if (isValid) {
//     form.register();
//   }
// });