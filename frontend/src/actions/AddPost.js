import React from 'react';
import { Container, Form, Button, Row, Col } from 'react-bootstrap';
import axios from '../middleware/axios'; 
import { jwtDecode } from 'jwt-decode';
import { useNavigate } from 'react-router-dom';

export default function AddPost() {
   //------gener select для добавления категории в список 
   const [geners, setGener] = React.useState([]);
   const[userId, setUserId] = React.useState('');
 
     React.useEffect(() => {
         const getGener = async () => {
             const response = await axios.get(`http://localhost:5000/geners`);
             setGener(response.data);
         };
         getGener();
         getProfile();
         // eslint-disable-next-line react-hooks/exhaustive-deps
     }, []);
     //-------для данных таблицы galery 
     const [title, setTitle] = React.useState('');
     const [description, setDescription] = React.useState('');
     const [file, setFile] = React.useState('');
     const [generId, setGenerId] = React.useState(0);
     //------idUser 
     const getProfile = async () => {
         try {
             const token = window.localStorage.getItem('token');
             const decoded = jwtDecode(token);
             setUserId(decoded.userId);
         }catch(error) {}
     };
     //-----для preview выбранной с диска картинки -image
     const [image, setImage] = React.useState({preview: '', data: ''});
     const handleFileChange =(e) => {
         const img ={
             preview: URL.createObjectURL(e.target.files[0]),
             data: e.target.files[0],
         };
         setImage(img); //for upload 
         setFile(img.data.name); //for record DB
     };
     //------------для создания redirect -переход по ссылке
     const navigate = useNavigate();
     //------сохранение записи в БД и загрузка image на сервер 
     const savePost = async (e) => {
         e.preventDefault();
         try{
             await axios.post(`http://localhost:5000/galery`, {
                 title: title,
                 description: description,
                 generId: generId,
                 userId: userId,
                 image: file,
             });
             //--upload image server
             let formData = new FormData();
             formData.append('file', image.data);
             await fetch(`http://localhost:5000/image`,{
                 method: 'POST',
                 body: formData,
             });
             navigate(`/galery`);
         }catch (error) {
             navigate(`/addgalerypost`);
         }
     };
     return (
     <Container className="mt-1">
         <h2 className="text-center">Добавить пост</h2>
         <Row> 
             <Col>
                 <Form onSubmit={savePost}>
                     <Form.Group className="mb-3" controlId="formControlText">
                         <Form.Label>Заголовок</Form.Label>
                         <Form.Control 
                             className="input"
                             type="text" 
                             placeholder="title"
                             value={title}
                             onChange={(e) => setTitle(e.target.value)} 
                         />
                     </Form.Group>
                     <Form.Group className="mb-3" controlId="formControlText">
                         <Form.Label>Описание:</Form.Label>
                         <Form.Control 
                             className="input"
                             as="textarea"
                             value={description}
                             onChange={(e) => setDescription(e.target.value)} 
                         />
                     </Form.Group>
                     <Form.Group className="mb-3" controlId="formControlText">
                         <Form.Label>Выбрать жанр</Form.Label>
                        <Form.Select name="generId" onChange={(e) => setGenerId(e.target.value)}>
                         <option key={0} value={0}>
                             Select Gener{' '}
                         </option>
                         {geners.map((data) =>(
                             <option key={data.id} value={data.id}>
                                 {data.name}
                             </option>
                         ))}
                        </Form.Select>
                     </Form.Group>
                     {image.preview && <img src={image.preview} width="100" height="100" alt="" />}
                     <hr></hr>
                     <Form.Group className="mb-3" controlId="formControlText">
                         <Form.Label>Выбрать файл:</Form.Label>
                         <Form.Control 
                             className="input"
                             type="file"
                             filename={file}
                             onChange={handleFileChange} 
                         />
                     </Form.Group>
                     <Button variant="primary" type="submit" >
                         Добавить пост
                     </Button>
                     <Button variant="primary" href='/galery'>
                         Галерея
                     </Button>
                     <Button variant="primary" href='/rules'>
                         Правила
                     </Button>
                 </Form>
             </Col>
         </Row>
     </Container>
   );
}
