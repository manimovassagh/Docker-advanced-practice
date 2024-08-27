import { useEffect, useState } from 'react';

interface Person {
  name: string;
  age: number;
}

function Name() {
  const [people, setPeople] = useState<Person[]>([]);

  useEffect(() => {
    fetch('http://localhost:8000/')
      .then(response => response.json())
      .then(data => setPeople(data))
      .catch(error => console.error('Error fetching data:', error));
  }, []);

  return (
    <div>
      <h1>Names</h1>
      <ul>
        {people.map((person, index) => (
          <li key={index}>{person.name}</li>
        ))}
      </ul>
    </div>
  );
}

export default Name;
    