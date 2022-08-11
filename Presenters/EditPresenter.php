<?php

declare(strict_types=1);

namespace App\Presenters;

use Nette;
use App\Model\DataEarning;
use Nette\Application\UI\Form;

final class EditPresenter extends Nette\Application\UI\Presenter
{
    private DataEarning $earnedData;

    private Nette\Database\Explorer $database;

    public function __construct(Nette\Database\Explorer $database, DataEarning $earnedData)
    {
        $this->database = $database;
        $this->earnedData = $earnedData;
    }

    public function startup(): void
    {
        parent::startup();

        if (!$this->getUser()->isLoggedIn()) {
            $this->redirect('Sign:in');
        }
    }

    public function renderEdit(int $postId): void
    {
        $post = $this->database
            ->table('pages')
            ->get($postId);

        if (!$post) {
            $this->error('Post not found');
        }

        $this->template->posts = $this->earnedData
            ->getData()
            ->limit(5);

        $this->template->allPosts = $this->database
            ->table('pages');

        $this->getComponent('postForm')
            ->setDefaults($post->toArray());
    }

    public function renderCreate(): void
    {
        $this->template->posts = $this->earnedData
            ->getData()
            ->limit(5);

        $this->template->allPosts = $this->database
            ->table('pages');
    }

    protected function createComponentPostForm(): Form
    {
        $form = new Form;
        $form->addText('name', 'Název: ')
            ->setRequired();
        $form->addText('property', 'Popis: ')
            ->setRequired();
        $form->addTextArea('text', 'Text: ')
            ->setRequired();

        $form->addSubmit('send', 'Uložit a publikovat');
        $form->onSuccess[] = [$this, 'postFormSucceeded'];

        return $form;
    }

    public function postFormSucceeded(array $data): void
    {
        $postId = $this->getParameter('postId');

        if ($postId) {
            $post = $this->database
                ->table('pages')
                ->get($postId);
            $post->update($data);

        } else {
            $post = $this->database
                ->table('pages')
                ->insert($data);
        }

        $this->redirect('Post:show', $post->ID);
    }
}