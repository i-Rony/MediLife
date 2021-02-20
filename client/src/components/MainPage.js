import React from 'react';
import Lottie from 'react-lottie';
import animationData from '../assets/30995-doctor-and-patient-conversation.json';
import animationData2 from '../assets/31830-heartlogo.json';
import { Link } from 'react-router-dom';


export default function MainPage() {
    const defaultOptions = {
        loop: true,
        autoplay: true, 
        animationData: animationData,
        rendererSettings: {
          preserveAspectRatio: 'xMidYMid slice'
        }
    };

    const defaultOptions2 = {
        loop: true,
        autoplay: true, 
        animationData: animationData2,
        rendererSettings: {
          preserveAspectRatio: 'xMidYMid slice'
        }
    };

    return (
        <div style={{display: 'inline'}}>
            <div className="row" style={{display: 'flex', margin: 'auto', paddingLeft: '5%', textAlign: 'justify'}}>
                <div style={{width: '60%', marginTop: '8%'}}>
                    <div style={{display: 'inline'}}>
                        <h3 style={{display: 'flex', fontFamily: 'Poppins', fontSize: 62 }}>MediLife</h3> 
                    </div>
                    <p style={{width: '80%', paddingBlock: 4, fontFamily: 'Oxygen', fontSize: 50}}>
                        An apple a day keeps the doctor away,
                        but if the doctor is cute forget the fruit.                  
                    </p>
                    <div style={{display: 'inline', justifySelf: 'auto'}}>
                        <Link to='/about'>
                            <button style={{background: 'transparent', borderRadius: 16, margin: 'auto', outline: 'none', cursor: 'pointer', paddingRight: 12, paddingLeft: 12, marginInlineEnd: 16}}>
                                <h3 style={{fontFamily: 'Poppins', fontSize: 22, fontWeight: 600, color: 'black'}}>About</h3>
                            </button>                            
                        </Link>
                        <Link to='/login'>
                            <button style={{background: 'transparent', borderRadius: 16, margin: 'auto', outline: 'none', cursor: 'pointer', paddingRight: 12, paddingLeft: 12}}>
                                <h3 style={{fontFamily: 'Poppins', fontSize: 22, fontWeight: 600, color: 'black'}}>Login</h3>
                            </button>                            
                        </Link>
                    </div>                             
                </div>
                <div style={{width: '50%', marginTop: '4%'}}>
                    <Lottie options={defaultOptions} height={'95%'} width={'95%'}/>
                </div>
            </div>
        </div>
    )
}
