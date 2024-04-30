import React from 'react';

export default function Rules() {
  return (
<div className="container">
    <div className="mt-5">
        <h2>Правила опубликования поста в галереи</h2>
        <ul className="list-group">
            <li className="list-group-item">Описание поста должно содержать не менее 250 символов.</li>
            <li className="list-group-item">Обязательные поля для заполнения: заголовок, описание, жанр и изображение.</li>
            <li className="list-group-item">Фотография должна быть в форматах JPEG, JPG или PNG.</li>
            <li className="list-group-item">Максимальный размер изображения - 10MB.</li>
            <li className="list-group-item">В описании и заголовке поста запрещены ненормативная лексика, контент для взрослых и порнография.</li>
            <li className="list-group-item">На фотографии не должны изображаться следующие элементы:
                <ul className="list-group">
                    <li className="list-group-item">Насилие или жестокость</li>
                    <li className="list-group-item">Нелегальные вещества или их употребление</li>
                    <li className="list-group-item">Сексуальные изображения или непристойные жесты</li>
                    <li className="list-group-item">Религиозная или политическая пропаганда</li>
                    <li className="list-group-item">Люди в состоянии алкогольного или наркотического опьянения</li>
                </ul>
            </li>
        </ul>
    </div>
</div>


  )
}
