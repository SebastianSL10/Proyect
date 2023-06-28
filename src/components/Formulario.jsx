import { useState } from "react"
import "./Formulario.css"

export function Formulario({ setUser }) {
    const [nombre, setNombre] = useState("")
    const [contraseña, setContraseña] = useState("")
    const [nombreError, setNombreError] = useState("")
    const [contraseñaError, setContraseñaError] = useState("")

    const handleSubmit = (e) => {
        e.preventDefault()

        let valid = true

        if (nombre === "") {
            setNombreError("El nombre es obligatorio")
            valid = false
        } else {
            setNombreError("")
        }

        if (contraseña === "") {
            setContraseñaError("La contraseña es obligatoria")
            valid = false
        } else {
            setContraseñaError("")
        }

        if (valid) {
            if (/\d/.test(nombre)) {
                setNombreError("El nombre no puede contener números")
            } else if (contraseña.length < 7) {
                setContraseñaError("La contraseña debe tener al menos 7 caracteres")
            } else {
                setNombreError("")
                setContraseñaError("")
                setUser([nombre])
            }
        }
    }

    return (
        <section>
            <form className="formulario" onSubmit={handleSubmit}>
                <h1>Bienvenido</h1>
                <input type="text" value={nombre} placeholder="usuario" onChange={e => setNombre(e.target.value)} />
                {nombreError && <p className="error">{nombreError}</p>}
                <input type="password" value={contraseña} placeholder="Contraseña" onChange={e => setContraseña(e.target.value)} />
                {contraseñaError && <p className="error">{contraseñaError}</p>}
                <button type="submit">Inicio sesión</button>
            </form>
        </section>
    )
}