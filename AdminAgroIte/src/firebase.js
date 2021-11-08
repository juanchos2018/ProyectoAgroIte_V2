import * as firebase from 'firebase';

const config = {
  apiKey: "AIzaSyASBVEzU8ZqFHtMgdYW7-66ZQjrZGf-lAc",
  authDomain: "fir-app-cf755.firebaseapp.com",
  databaseURL: "https://fir-app-cf755.firebaseio.com",
  projectId: "fir-app-cf755",
  storageBucket: "fir-app-cf755.appspot.com",
  messagingSenderId: "89775705065",
  appId: "1:89775705065:web:ba95caaf98b67340f71978",
  measurementId: "G-MS4YLMV4MC"
};
firebase.initializeApp(config);

export default firebase;