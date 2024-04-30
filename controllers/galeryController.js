import Galery from '../models/galery.js';

//получить список всех постов и жанр
export const getAllPostsGalery = async(req, res) => {
    try {
        const posts = await Galery.findAll({
          include: ['geners', 'user'],
          where: {},
          order: [['createdAt', 'DESC']],       
        });
    
        res.json(posts);
      } catch (error) {
        res.status(500).json({ message: error.message });
      }
};
//получить одну запись по ид + gener.name
export const getPostById = async(req, res) => {
    try{
        const post = await Galery.findAll({
        include:['geners','user'],
        where:{id: req.params.id},
    });
    res.json(post[0]);    
    }catch(error){
        res.json({message: error.message});
    }
};
//получить list posts по generId + gener.name
export const getPostByIdGener = async(req, res) => {
    try{
        const posts = await Galery.findAll({
        include:['geners','user'],
        where:{generId: req.params.id},
        order: [['createdAt', 'DESC']],
    });
    res.json(posts);    
    }catch(error){
        res.json({message: error.message});
    }
};
//-----------------------------------------------
//create post
export const createPostGalery = async(req, res) => {
    try{
        await Galery.create(req.body);
        res.json({message: 'Post In Galery Created'});
    }catch(error){
        res.json({message: error.message});
    }
};

//update
export const updatePostGalery = async(req, res) => {
    try{
        await Galery.update(req.body,{
            where: {id: req.params.id},
        });
        res.json({message: 'Post In Galery Updated'});
    }catch(error){
        res.json({message: error.message});
    }
};

//delete
export const deletePostGalery = async(req, res) => {
    try{
        await Galery.destroy({
            where: {id: req.params.id},
        });
        res.json({message: 'Post In Galery Deleted'});
    }catch(error){
        res.json({message: error.message});
    }
};