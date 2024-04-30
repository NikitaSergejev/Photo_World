import React,{ useState, useEffect } from 'react';
import axios from '../middleware/axios';
import {Container, Row, Col, Button} from 'react-bootstrap';
import Card from 'react-bootstrap/Card';
import moment from 'moment';
//import {Link} from 'react-router-dom';
import { jwtDecode } from 'jwt-decode';
import { Link } from 'react-router-dom';


export default function GaleryPost({generId}) {
  const [posts, setPosts] = useState([]);
  const [name, setName] = React.useState('');
   //--------------
  
   React.useEffect(() => {
    getMe();
}, []);
const getMe = async () => {
    try{ 
    const token = localStorage.getItem('token');
    if (token) {
        const decoded = jwtDecode(token); // Декодируем токен
        setName(decoded.name);
    }
    }catch(error) {
        if(error.response){            
        }
    }
};
/*useEffect(() => {
  const fetchData = async () => {
    await getPosts();
  };

  fetchData();
}, );*/
useEffect(() => {
  //маршруты, если выбрана или НЕ выбрана категория
  const gener_id = generId > 0 ? `/gener/${generId}` : '';
  const getPosts = async () => {
      const response = await axios.get(`http://localhost:5000/galery${gener_id}`); // Get posts
      setPosts(response.data);
      
  };
  getPosts();
  
}, [generId]);
  //Список новостей из БД
  /*const getPosts = async () => {
    try {
      const response = await axios.get(`http://localhost:5000/galery`, {
        
      });
      setPosts(response.data);
    } catch (error) {
      console.error('Error fetching posts:', error);
    }
  };*/
  
      posts.forEach((post) => {
        const formatDate = moment(post.createdAt).locale('en-US').format('l');
      post.createdAt = formatDate;
    });
 // Функция для удаления поста
 const deletePostGalery = async(id) =>{
  if (window.confirm('Are you sure you want to delete'+id+'?')){
      await axios.delete(`http://localhost:5000/galery/${id}`);
      // Обновляем список постов после удаления
      const gener_id = generId > 0 ? `/gener/${generId}` : '';
      const response = await axios.get(`http://localhost:5000/galery${gener_id}`);
      setPosts(response.data);
  }
};
 

  return (
    <Container fluid className="mt-4">
    <p>Количество постов: {posts.length}</p>
    <Row xs={1} md={2} className="g-6">
      {posts.map((data) => (
        <Col key={data.id}>
          <Card className="m-2 bg-light" >
            <Card.Img
              variant="top"
              src={`./images/${data.image}`}
              style={{
                height: 280 }}
            />
            <Card.Body>
              <Card.Title>{data.title}</Card.Title>
              <Card.Text>Автор: {data.user.name}</Card.Text>             
              <Card.Text>Дата публикации: {data.createdAt}</Card.Text>
              <Card.Text>Жанр: {data.geners.name}</Card.Text>
              <Link to={`/detailgalery/${data.id}`} className="me-1">
                <button className="btn btn-primary">Подробнее</button>
              </Link>
              {name.toLowerCase() === data.user.name.toLowerCase() || name === 'admin' ? (
                <Button onClick={() => deletePostGalery(data.id)} variant='danger' size='sm'>Delete</Button>
              ) : null}
            </Card.Body>
          </Card>
        </Col> 
      ))}
    </Row>    
  </Container>
  );
}
   