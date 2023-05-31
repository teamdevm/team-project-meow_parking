import './App.css';
import { BrowserRouter,Route,Routes } from 'react-router-dom';
import Login from './Pages/LoginPage'
import SignUp from './Pages/SignUpPage'
import Home from './Pages/Home';
//import MyForm from './Pages/MyForm';
// <Route path='/MyForm' element={<MyForm />} />
import Header from "./Components/Header";
//import '../node_modules/bootstrap/dist/css/bootstrap.min.css';

function App() {
  
  return(
    //настройка маршпутизаторов
    <>
    <BrowserRouter>
      <Routes>
        <Route path='/' element={<Login/>}/>
        <Route path='/signup' element={<SignUp/>}/>
        <Route path='/home' element={<Home />} />
      </Routes>
    </BrowserRouter>
  </>
  )
}

export default App;
