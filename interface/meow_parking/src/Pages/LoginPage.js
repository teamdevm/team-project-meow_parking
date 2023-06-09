
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
      }
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
  
  
    changeHandler=(e)=>{
      this.setState({[e.target.name]:e.target.value})
    }
    submitHandler =e=>{
      e.preventDefault()
      console.log(this.state)
      axios.post('https://jsonplaceholder.typicode.com/posts',this.state)
          .then(response=>{
              console.log(response)
          })
          .catch(error=>{
              console.log(error)
          })
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
                Ещё нету аккаунта?
                <b 
                    onClick={this.navigateToSignUp} 
                    className="font-montesserat hover: underline cursor-pointer"
                >
                    Зарегестрируйтесь
                </b>
            </p>
        </div>
    </div>

      )
    }
}
export default withRouter(Login)
