import React from 'react'

const Header = () => {
    return (
      <div className="sticky top-0 bg-white rounded-b-2xl  text-indigo-50">
        <header>
          <ul className="list-none flex justify-center gap-4">
            <h1 className="p-2 text-center text-black">Название сайта</h1>
          </ul>
        </header>
      </div>
    );
  };
  export default Header;