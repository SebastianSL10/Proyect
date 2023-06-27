import { useState } from "react"
import "./Formulario.css"
export { useState } from "react"

export function Formulario({setUser}) {
    const [nombre, setNombre] = useState("")
    const [contraseña, setContraseña] = useState("")
    const [error, setError] = useState(false)

    const handleSubmit = (e) => {
        e.preventDefault()

        if (nombre == "" || contraseña == "") {
            setError(true)
            return
        }
        setError(false)
        
        setUser([nombre])
    }

    return (
        <section>
           
            <form className="formulario" onSubmit={handleSubmit}>
                <h1>Bienvenido</h1>
                <input type="text" value={nombre} placeholder="Usuario" onChange={e=> setNombre(e.target.value)} />
                <input type="password" value={contraseña} placeholder="Contraseña " onChange={e=> setContraseña(e.target.value)}/>
                <button>Inicio sesion</button>
                { error && <p>Todos los campos son obligatorios</p>}
            </form>
            
        </section>
    )
}