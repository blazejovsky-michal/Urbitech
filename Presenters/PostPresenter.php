<?php

declare(strict_types=1);

namespace App\Presenters;

use Nette;
use App\Model\DataEarning;
use Nette\Application\UI\Form;

final class PostPresenter extends \Nette\Application\UI\Presenter
{
    private DataEarning $earnedData;
    private Nette\Database\Explorer $database;

    public function __construct(Nette\Database\Explorer $database, DataEarning $earnedData)
    {
        $this->database = $database;
        $this->earnedData = $earnedData;
    }

    public function renderShow(int $postId): void
    {
        $post = $this->database
            ->table('pages')
            ->get($postId);
        if (!$post) {
            $this->error('Stránka nebyla nalezena');
        }

        $this->template->usedTags = $this->database
            ->table('used');

        $this->template->allTags = $this->database
            ->table('tags');

        $this->template->posts = $this->earnedData
            ->getData()
            ->limit(5);

        $this->template->allPosts = $this->database
            ->table('pages');

        $this->template->post = $post;
    }

    public function handleAdd($tag, $page){
        $var = false;
        $controll = $this->database
            ->table('used')
            ->where('page', $page);

        foreach ($controll as $property) {
            if ($property->tag == $tag) {
                $var = true;
            }
        }

        if ($var != true){
            $this->database->query('INSERT INTO used ?', [
                'page' => $page,
                'tag' => $tag,
            ]);
        } else {
            $this->database->query('DELETE FROM used WHERE ?', [
                'page' => $page,
                'tag' => $tag,
            ]);
        }
    }

    public function handleDelete($page){
        $this->database->query('DELETE FROM pages WHERE ?', [
            'ID' => $page,
        ]);

        $this->database->query('DELETE FROM used WHERE ?', [
            'page' => $page,
        ]);

        $this->redirect('Homepage:');
    }
}
