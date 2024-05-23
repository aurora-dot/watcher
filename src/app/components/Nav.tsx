import { Overpass_Mono } from 'next/font/google';

const overpassMono = Overpass_Mono({ subsets: ['latin'] });

export default function Nav() {
  return (
    <nav className='flex flex-grow-0 justify-center py-4'>
      <p className={overpassMono.className + ' text-3xl font-bold'}>
        <a href='/'>WATCHER</a>
      </p>
    </nav>
  );
}
