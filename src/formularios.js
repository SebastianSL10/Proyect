import React,{useState} from "react";

export default function Formularios(){
    const [nombre,setNombre] = useState("");
    const [marca,setMarca] = useState("");
    const [lenguaje,setLenguaje] = useState("");
    return (
        <>
        <h1>Formularios</h1>
        <form>
            <label htmlFor="nombre">Nombre:</label>
            <input 
            type="text" 
            id="nombre" 
            name="nombre" 
            value={nombre}
            onChange={(e)=> setNombre(e.target.value)
            }/>
            <p>Elige tu Marca Favorita:</p>
            <input 
            type="radio" 
            id="Apple" 
            name="marca" 
            value="Apple" 
            onChange={(e)=>setMarca(e.target.value)}
            />
            <label htmlFor="Apple">Apple</label>
            <input 
            type="radio" 
            id="Samsung" 
            name="marca" 
            value="Samsung" 
            onChange={(e)=>setMarca(e.target.value)}
            />
            <label htmlFor="Samsung">Samsung</label> 
            <input 
            type="radio" 
            id="Xiaomi" 
            name="marca" 
            value="Xiaomi" 
            onChange={(e)=>setMarca(e.target.value)}
            />
            <label htmlFor="Xiaomi">Xiaomi</label>
            <input 
            type="radio" 
            id="Huawei" 
            name="marca" 
            value="Huawei" 
            onChange={(e)=>setMarca(e.target.value)}
            />
            <label htmlFor="Huawei">Huawei</label>
            <p>Elige tu lenguaje de programación favorito</p>
            <select name="lenguaje" onChange={(e)=>setLenguaje(e.target.value)}>
                <option value="">---</option>
                <option value="js">JavaScript</option>
                <option value="php">PHP</option>
                <option value="py">Python</option>
                <option value="go">GO</option>
                <option value="rb">Ruby</option>
            </select>  
        </form>
        </>
    );

}