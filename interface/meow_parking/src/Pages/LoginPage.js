
import React,{Component} from 'react'
import Header from "../Components/Header";
import axios from 'axios'
import {withRouter} from '../Components/withRouter';

class Login extends Component{


    constructor(props){
      super(props)
      //для перехода по страницам
      this.navigateToHome=this.navigateToHome.bind(this);
      this.navigateToLogin=this.navigateToLogin.bind(this);
      this.navigateToSignUp=this.navigateToSignUp.bind(this);
      //
      this.state={
        email: '',
        password: '',
        emailerr:'',
        passerr:''
      }
    }
    //проверяет корректность полей
    validate(){
      let email=this.state.email;
      let password=this.state.password;
      let emailerr='';
      let passerr='';
      let isValid = true;

      if(!email){
          isValid=false;
          emailerr="Нужно ввести почту"
      }

      if (typeof email !== "undefined"){
        var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
        if(!pattern.test(email)){
          isValid=false;
          emailerr="Введите почту правильно"
        }
      }

      if(!password){
        isValid=false;
        passerr="Нужно ввести пароль"
      }
      if (typeof password !== "undefined"){
        if(password.length<4){
          isValid=false;
          passerr="Нужно ввести более 4 символов"
        }
      }
      this.setState({
        passerr:passerr,
        emailerr:emailerr
      })
      return isValid;
    }

    navigateToHome()
    {
        this.props.navigate('/home')
    } 
    navigateToLogin()
    {
        this.props.navigate('/')
    } 
    navigateToSignUp()
    {
        this.props.navigate('/signup')
    }

    //чтобы были введены поля
   /////////


    //при изменении в полях
    changeHandler=(e)=>{
      let emailerr='';
      let passerr='';
      this.setState({[e.target.name]:e.target.value})
      if(e.target.name=="password"){
        this.setState({passerr:passerr})
      }else if(e.target.name=="email"){
        this.setState({emailerr:emailerr})
      }
      
    }

    //при нажатии на кнопку
    submitHandler =async e=>{     
      e.preventDefault()
      
      //проверяет на пустоту полей
      if(this.validate())
      {
        console.log(this.state)
        //datta to POST send
        let l_data = {
          email: this.state.email, password : this.state.password
        }
        console.log('aboba')
        const requestOptions = {
          method: 'POST',
          headers: { 'Content-Type': 'application/json','accept': 'application/json'},
          body: JSON.stringify(l_data)
        };

        //fetch async
        try{
          const response =await fetch('http://127.0.0.1:8000/api/login', requestOptions)
          if(response.ok){
            console.log("sucsessful");
            let reschecked=response;
            let info = await reschecked.json();
            
            //проверка на правильность ввода данных
            if(info.hasOwnProperty("WRONG PASS") ||info.hasOwnProperty("NOT FOUND") ){
              console.log(info)
              console.log("False")
              
              let passerr="Неверный пароль или почта";
              let emailerr="Неверный пароль или почта";
              let password=''
              this.setState({
                passerr:passerr,
                emailerr:emailerr,
                password:password
              })
            }
            else if(info.hasOwnProperty("SUCCESS")){
              console.log(info)
              console.log("Yes")
              this.navigateToHome();
            }
          }
          else {console.log("unsecsessful")}
        }
        catch(err){
          console.error(err.message);
        }
      }
    }
    render()
    {

      //состояние ввода
      const{email,password}=this.state
      return(
        <div className=" bg-green-200 relative flex flex-col justify-center min-h-screen overflow-hidden">
        <Header />
        <script>/* описание окна авторизации*/</script>
        <div className="w-full p-6 m-auto bg-white rounded-md ring ring-2 ring-transparent lg:max-w-xl">
            <h1 className="text-3xl font-montesserat text-center text-black">
              Авторизация
            </h1>
            <form >
            <script>/* описание email */</script>
              <div className="mb-2">
                <label
                    htmlFor="email"
                    className="block text-sm font-montesserat text-gray-800"
                >
                    Почта
                </label>
                <script>/*значение value для передачи введеных значений пароля и почты в useState*/</script>
                <script>/*setFormInput формула для чтения данных с формы*/</script>
                <input  
                    onChange={this.changeHandler}            
                    value={email}
                    type="text"
                    name="email"
                    className="block w-full px-4 py-2 mt-2 text-purple-700 bg-white border rounded-md focus:border-purple-400 focus:ring-purple-300 focus:outline-none focus:ring focus:ring-opacity-40"
                />
                <div className='font-montesserat text-red-400'> {this.state.emailerr}</div>
              </div>
              <script>/* описание пароля*/</script>
              <div className="mb-2">
                <label
                    htmlFor="password"
                    className="block text-sm font-montesserat text-gray-800"
                >
                    Пароль
                </label>
                <input
                    onChange={this.changeHandler}                              
                    value={password}
                    type="password"
                    name="password"
                    className="block w-full px-4 py-2 mt-2 text-purple-700 bg-white border rounded-md focus:border-purple-400 focus:ring-purple-300 focus:outline-none focus:ring focus:ring-opacity-40"
                />
                <div className='font-montesserat text-red-400'> {this.state.passerr}</div>
              </div>
              
              <script>/* описание кнопки авторизации*/</script>
              <div className="mt-6">
                    <button type="submit" onClick={this.submitHandler} className="w-full px-4 py-2 font-montesserat tracking-wide text-black transition-colors duration-200 transform bg-blue-100 rounded-md hover:bg-purple-600 focus:outline-none focus:bg-purple-600">
                        Авторизоваться
                    </button>
                </div>
            </form>
            <script>/* описание кнопки для регистрации*/</script>
            <p className="font-montesserat">
                Ещё нет аккаунта?
                <b 
                    onClick={this.navigateToSignUp} 
                    className="font-montesserat hover: underline cursor-pointer"
                >
                    Зарегистрируйтесь
                </b>
            </p>
        </div>
    </div>

      )
    }
}
export default withRouter(Login)
