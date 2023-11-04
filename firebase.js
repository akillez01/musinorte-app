// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getStorage } from "firebase/storage"
const firebaseConfig = {
  apiKey: "AIzaSyBU4xzGB2nFOQnSys5vqO4glxkTb0Y2Fvw",
  authDomain: "musinorte.firebaseapp.com",
  projectId: "musinorte",
  storageBucket: "musinorte.appspot.com",
  messagingSenderId: "876491975334",
  appId: "1:876491975334:web:dc43c147301bfc2c6c2267",
  measurementId: "G-0V3S2JX8LS"
};

// Initialize Firebase
export const app = initializeApp(firebaseConfig);
export const storage = getStorage(app);