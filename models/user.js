const mongoose=require('mongoose');
const userSchema=mongoose.Schema({
    name:{
        type:String,
        required:true,
        trim:true
    },

    email:{
        type:String,
        required:true,
        trim:true,
        validate:{
        validator:(value)=>{
            const reg=/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
            return value.match(reg);
        },
        message:"Email Inválido"
        }
    },

    password:{
        required:true,
        type:String,
    },

    address:{
        type:String,
        default:""
    },

    type:{
        type:String,
        default:"user"
    }

    });

const User=mongoose.model("User",userSchema);
module.exports=User;