import express from 'express';
import { checkAuth } from '../validations/checkAuth.js';
import {
    getAllPostsGalery,
    getPostById,
    getPostByIdGener,
    createPostGalery,
    updatePostGalery,
    deletePostGalery,
}from '../controllers/galeryController.js';


 
const galeryrouter = express.Router(); // Создаем экземпляр маршрутизатора 
galeryrouter.get('/', checkAuth, getAllPostsGalery);
galeryrouter.get('/:id', getPostById);
galeryrouter.get('/gener/:id', checkAuth, getPostByIdGener);

galeryrouter.post('/', checkAuth, createPostGalery); // create
galeryrouter.patch('/:id', checkAuth, updatePostGalery); // put
galeryrouter.delete('/:id', checkAuth, deletePostGalery); // delete

export default galeryrouter;