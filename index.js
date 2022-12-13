console.log ("Hello World");
const express=require("express");
const mongoose=require("mongoose");
const authRouter=require("./Routes/auth")

const PORT =3000;
const app=express();
const DB="mongodb+srv://Rick:fdfd2000@cluster0.uflpwdj.mongodb.net/?retryWrites=true&w=majority";

app.use(express.json());
app.use(authRouter);

mongoose.connect(DB).then(()=>{
    console.log("Connected to database!")
}).catch((e)=>{
    console.log("Connection failed!")

});

app.listen(PORT,"0.0.0.0",()=>{
console.log(`Connected at PORT ${PORT}`);
});