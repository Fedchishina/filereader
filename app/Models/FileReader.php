<?php


class FileReader implements SeekableIterator
{
    private $position;
    private $fileArray;

    public function __construct($file)
    {
        $this->position = 0;
        $this->fileArray = file($file);
    }

    public function current()
    {
        return $this->fileArray[$this->position];
    }

    public function next()
    {
        ++$this->position;
    }

    public function key()
    {
        return $this->position;
    }

    public function valid()
    {
        return isset($this->array[$this->position]);
    }

    public function rewind()
    {
        $this->position = 0;
    }

    public function seek($position)
    {
        if (!isset($this->fileArray[$position])) {
            throw new OutOfBoundsException("недействительная позиция поиска ($position)");
        }

        $this->position = $position;
    }

}