export function Home({ user, setUser }) {
    const handleLogout = () => {
        setUser([])
    }
    return (
        <div>
            <h1>hola:3</h1>
            <h2>{user}</h2>
            <button onClick={handleLogout}> cerrar sesion</button>
        </div>
    )
}